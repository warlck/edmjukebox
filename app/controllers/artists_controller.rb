class ArtistsController < ApplicationController

	def show
		#debugger
		@artist = Artist.find(params[:id])
	end
end