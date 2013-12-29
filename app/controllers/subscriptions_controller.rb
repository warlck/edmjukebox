class SubscriptionsController < ApplicationController

	def create
		current_user.subscribe_to_artist params[:artist_id]
		redirect_to user_path current_user
	end
end