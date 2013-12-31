class PodcastsController < ApplicationController
	def play

   	   if session[:current_user]
          podcast = Podcast.find(session[:current_user])

          podcast.update_attribute(:current_time, params[:time] )

          session[:current_user] = params[:id]
	   else 
	   	  session[:current_user] = params[:id]
	   end

	   @podcast = Podcast.find(params[:id])	
	   @artist = @podcast.artist
	end
end