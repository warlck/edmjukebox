# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery



   def login user, permanent = false
	 if permanent  
	    cookies.permanent[:auth_token] = user.auth_token
	 else
	    cookies[:auth_token] = user.auth_token
	 end
   end

  def current_user
  	@cuurent_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user
end
