class Account < ActiveRecord::Base
  	# Devise modules
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, 
           :validatable, :encryptable

    # Trinity Core db table name
	self.table_name = "account"

	has_one :access, :foreign_key => "id"
	before_save :set_username

	validates :email, presence: true, uniqueness: true, confirmation: true, length: { in: 6..20 }
	validates :password, confirmation: true
	validates_length_of :password, in: 6..16, on: :create
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	# Set username as email
	def set_username
		unless email.blank?
			self.username = email
		else
			false
		end
	end

	# Passing email as salt to custom encryptor
	def password_salt
  		email
	end

  	def password_salt=(value)
  		email
  	end

  	# Using auth db field 'sha_pass_hash' instead of devise 'encrypted_password'
  	def encrypted_password
    	return sha_pass_hash
  	end

  	def encrypted_password=(value)
  		self.sha_pass_hash = value
  	end

end
