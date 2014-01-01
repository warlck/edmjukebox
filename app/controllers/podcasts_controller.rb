class PodcastsController < ApplicationController
	def play

   	   if session[:current_podcast]
          podcast = Podcast.find(session[:current_podcast])
          session[:current_podcast] = params[:id]
          update_time podcast
	   else 
	   	  session[:current_podcast] = params[:id]
	   end
	   @podcast = Podcast.find(params[:id])	
	   cookies[:last_played_id] = params[:id] 
	   @artist = @podcast.artist
	end



	private 
	  def update_time podcast
	  	if params[:time]
	  	  podcast.update_attribute(:current_time, params[:time]) 
	  	end
	  end
end