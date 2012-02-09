class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
           
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
    @user.create_date = Time.new.strftime('%Y-%m-%d')
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user,
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