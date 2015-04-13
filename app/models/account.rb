class Account < ActiveRecord::Base
	self.table_name = "account"

	attr_accessor :password

	before_save :encrypt_password
	after_save :clear_variable

	validates :email, presence: true, uniqueness: true, confirmation: true, length: { in: 6..20 }
	validates :password, confirmation: true
	validates_length_of :password, in: 6..16, on: :create
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	def encrypt_password
		if password.present?
			self.sha_pass_hash = Digest::SHA1.hexdigest("#{email}:#{password}")
			self.username = "#{email}"
		end
	end

	def clear_variable
		self.password = nil
	end

	def self.authenticate(username, password)
    	user = find_by username: username
    	if user && user.sha_pass_hash == Digest::SHA1.hexdigest("#{username}:#{password}")
    		user.username  = Digest::SHA1.hexdigest("#{username}:#{password}")
    		user
    	else
    		nil
    	end
	end

end
