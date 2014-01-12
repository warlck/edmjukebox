class SessionsController < ApplicationController

	def new
	end

	def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
        	login user, params[:remember_me]
			redirect_to root_path
		else
			 flash.now.alert = "Email or password is invalid"
			 render :new
		end
	end

	def destroy
		cookies.delete(:auth_token)
		redirect_to root_path
	end

	private 

	
end

