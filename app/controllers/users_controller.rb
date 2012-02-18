require 'digest'

class UsersController < ApplicationController  
  
  def show
    @user = User.find_by_username(params[:username])    
    @posts = Post.find_all_by_user_id(@user.id)
        
  end
  
  def index
    @users = User.all
    
    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => @users }
    end
  end
  
  def new
    @user = User.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @user }
    end
  end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to('/' + @user.username,
                       :notice => 'Successfully created user.') }
        format.json { render :json => @user,
                       :status => :created, :location => @user }
      else
        format.html { render :action => 'new' }
        format.json { render :action => @user.errors,
                      :status => :unprocessable_entity }                 
      end
    end
  end  
end