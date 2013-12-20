# -*- encoding : utf-8 -*-
Edmplayer::Application.routes.draw do
root :to =>  "players#show"

resource :player , only: [:show], as: "player"
resources :artists, only: [:show]

end
