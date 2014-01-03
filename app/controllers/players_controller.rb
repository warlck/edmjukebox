# -*- encoding : utf-8 -*-
class PlayersController < ApplicationController
	def show
		@artists = Artist.all
		@podcasts = Podcast.limit(10)

	end
end
