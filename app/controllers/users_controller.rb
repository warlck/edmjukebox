class UsersController < ApplicationController

	def show
		@artists = current_user.artists.includes(:podcasts)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save 
			redirect_to root_url, notice: "Successfully Registered"
		else
			render :new
		end
	end
end