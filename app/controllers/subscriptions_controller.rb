class SubscriptionsController < ApplicationController

	def create
		current_user.subscribe_to_artist params[:artist_id]
		respond_to do |format|
		        format.html { redirect_to user_path current_user }
		        format.js   { render 'create.js.erb'}
        end
		
	end
end