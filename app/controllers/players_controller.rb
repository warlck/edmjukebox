class PlayersController < ApplicationController
	def show
		@artists = Artist.all
	end
end