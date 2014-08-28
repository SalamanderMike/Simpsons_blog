class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated?
    redirect_to login_url if session[:user_id].nil?
   	# redirect_to login_url  unless current_user
  end

  def current_user
  	# @current_user = @current_user || User.find(session[:user_id])

  	@current_user ||= User.find(session[:user_id]) if !@current_user
  end

end