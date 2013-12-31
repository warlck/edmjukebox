class PodcastsController < ApplicationController
	def play
	   @podcast = Podcast.find(params[:id])	
	   @artist = @podcast.artist
	end
end