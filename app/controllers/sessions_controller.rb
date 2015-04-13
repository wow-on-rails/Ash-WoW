class SessionsController < ApplicationController

	def new
	end

	def create
		user = Account.authenticate(params[:username], params[:password])
		if user
			session[:user_id] = user.id
			redirect_to root_path
		else
	    	flash[:error] = "Invalid email or password"
			redirect_to log_in_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"
	end

end
