class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user, :players_online, :server_status

	private

	def current_user
	  @current_user ||= Account.find(session[:user_id]) if session[:user_id]
	end

	def players_online
		@players_online ||= Character.where(online: 1).count
	end

	def connect(host = Settings.server.ip, port = Settings.server.port, timeout = 2)
	  # Convert the passed host into structures the non-blocking calls
	  # can deal with
	  addr = Socket.getaddrinfo(host, nil)
	  sockaddr = Socket.pack_sockaddr_in(port, host)

	  Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0).tap do |socket|
	    socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)

	    begin
	      # Initiate the socket connection in the background. If it doesn't fail 
	      # immediatelyit will raise an IO::WaitWritable (Errno::EINPROGRESS) 
	      # indicating the connection is in progress.
	      socket.connect_nonblock(sockaddr)

	    rescue IO::WaitWritable
	      # IO.select will block until the socket is writable or the timeout
	      # is exceeded - whichever comes first.
	      if IO.select(nil, [socket], nil, timeout)
	        begin
	          # Verify there is now a good connection
	          socket.connect_nonblock(sockaddr)
	        rescue Errno::ECONNREFUSED
	          socket.close
	          return false
	        rescue Errno::EISCONN
	          # Good news everybody, the socket is connected!
	        rescue
	          # An unexpected exception was raised - the connection is no good.
	          socket.close
	          return false
	        end
	      else
	        # IO.select returns nil when the socket is not ready before timeout 
	        # seconds have elapsed
	        socket.close
	        return false
	      end
	    end
	  end
	end

	def server_status
		if(Settings.server.lastUpdate.nil?)
			Settings.lastUpdate = Time.current
			check_connection
		else
			if(Time.current - Time.parse(Settings.server.lastUpdate) > Settings.server.diff)
				Settings.lastUpdate = Time.now
				check_connection
			else
				Settings.server.lastUpdateResult
			end
		end
	end

	def check_connection
		connection = connect(Settings.server.ip, Settings.server.port, 2)

		if !connection
			Settings.server.lastUpdateResult = "offline"
		else
			Settings.server.lastUpdateResult = "online"
		end
	end


end
