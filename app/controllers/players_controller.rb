# -*- encoding : utf-8 -*-
class PlayersController < ApplicationController
	def show
		@artists = Artist.scoped
		@podcasts = Podcast.limit(10)
	end
end
