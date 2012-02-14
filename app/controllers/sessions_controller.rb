class SessionsController < ApplicationController
  def new
    @title = 'Sign in'
  end
  
  def create
    user = User.find(:first, 
           :conditions => ['email = :e', {:e => params[:session][:email]}])
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to users_path, :notice => "Logged in!"
    else
      flash.now[:error] = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice => "Logged out!"
  end
end
