class ApplicationController < ActionController::Base
  protect_from_forgery
  # include SessionHelper
  helper_method :current_user, :user_signed_in?, :user_signed_out?
  
  
  def current_user    
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  
  def user_signed_in?
    !!current_user
  end
  
  def user_signed_out?
    !user_signed_in?
  end
end
