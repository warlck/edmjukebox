# -*- encoding : utf-8 -*-
Edmplayer::Application.routes.draw do
root :to =>  "players#show"

resources :player , only: [:show]

end
