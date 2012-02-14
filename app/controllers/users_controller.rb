require 'digest'

class UsersController < ApplicationController  
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def show
    @user = User.find(params[:id])
    @posts = Post.find(:all, 
              :conditions => ['user_id = :u', {:u => params[:id]}])    
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
  
  private
    
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(submitted_password)
    end
    
    def encrypt(string)
      secure_hash('#{salt}--#{string}')
    end
    
    def make_salt
      secure_hash('#{Time.now.utc}--#{password}')
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end