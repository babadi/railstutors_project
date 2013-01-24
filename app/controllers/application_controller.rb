class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

  def current_user
  	logged_in? ? User.where(id: session[:user_id]).first : nil
  end

  def logged_in?
  	!!session[:user_id]
  end

  def require_user
  	unless logged_in?
  		redirect_to root_path, alert: "You must be logged in to do this"
  	end
  end
end
