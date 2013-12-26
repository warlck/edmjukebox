# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery



  def current_user
  	@cuurent_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
