class PasswordResetsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		UserMailer.password_reset(user).deliver
		redirect_to root_url, notice: "Email sent with password resetting instructions"
	end


end