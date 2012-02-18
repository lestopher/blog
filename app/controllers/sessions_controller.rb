class SessionsController < ApplicationController
  before_filter :user_signed_in?, :only => [:delete]
  
  def new
    @title = 'Sign in'
  end
  
  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to users_path, notice => "Logged out!"
  end
end
