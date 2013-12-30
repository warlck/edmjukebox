class UsersController < ApplicationController

	def show

		@artists = current_user.artists.includes(:podcasts)
		
		 if !params[:artist_id] 
		 	@podcasts = @artists.first.podcasts
		 else
		 	@podcasts = Artist.find(params[:artist_id]).podcasts
		 	respond_to do |format|
		        format.html { redirect_to tasks_url }
		        format.js  { render 'change_artist.js.erb'}
		    end
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