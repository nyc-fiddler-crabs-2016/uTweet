class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :authorized?

  def current_user
    @user ||= User.find session[:user_id] if session[:user_id]
  end

  def authorized?(tweet)
    current_user && (current_user.id == tweet.poster_id)
  end
end
