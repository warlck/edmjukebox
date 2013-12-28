# -*- encoding : utf-8 -*-
Edmplayer::Application.routes.draw do
root :to =>  "players#show"

get "logout", to: "sessions#destroy" , as: "logout"
get "login", to: "sessions#new", as: "login"
get "signup", to: "users#new", as: "signup"

resource :player , only: [:show], as: "player"
resources :artists, only: [:show]
resources :users , only: [:new, :create]
resources :sessions, only: [:new, :create]
resources :password_resets ,only: [:new, :create, :update, :edit]
end
