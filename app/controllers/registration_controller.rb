class RegistrationController < ApplicationController

  def index
  	@user = Account.new
  end

	def create
		@user = Account.new(user_params)
		if @user.save
			flash.now[:success] = "Registration completed successfully"
		else
			flash.now[:error] = "Please, check your data"
		end
		render 'index'
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email, :email_confirmation)
	end
end
