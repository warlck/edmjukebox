class PodcastsController < ApplicationController
	def play
   	   update_current_podcast
	   @podcast = Podcast.find(params[:id])	
	   @artist = @podcast.artist
	end



	private 

     def update_current_podcast
       if session[:current_podcast]
          podcast = Podcast.find(session[:current_podcast])
          session[:current_podcast] = params[:id]
          update_time podcast, params[:time]
	   else 
	   	  session[:current_podcast] = params[:id]
	   end
     end

	  def update_time podcast, time
	  	if time
	  	 # debugger
	  	  current_user.try(:update_time, podcast, time)
	  	end
	  end
end