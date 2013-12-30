class UsersController < ApplicationController

	def show

		@artists = current_user.artists.includes(:podcasts)
		@podcasts = 
		 if !params[:artist_id] 
		 	@artists.first.podcasts
		 else
		 	Artist.find(params[:artist_id]).podcasts
		 end

		 
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