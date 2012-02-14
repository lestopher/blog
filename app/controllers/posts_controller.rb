class PostsController < ApplicationController
  # before_filter :get_userId, :only => [:new]
#   
  # def get_userId
    # @userId = User.find(params[:username]).id
  # end
  
  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html #show.html.erb
      format.json { render :json => @post }
    end
  end
  
  def index
    @posts = Post.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @post }
    end 
  end
  
  def create
    user = User.find(:first, 
           :conditions => ['username = :u', {:u => params[:username]}])  
    @post = Post.new(params[:post])
    @post.user_id = user.id
    @post.create_date = Time.new.strftime('%Y-%m-%d')
    
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post,
                       :notice => 'Successfully created user.') }
        format.json { render :json => @post,
                       :status => :created, :location => @post }
      else
        format.html { render :action => 'new' }
        format.json { render :action => @post.errors,
                      :status => :unprocessable_entity }                 
      end
    end
  end
  
  def new
    @post = Post.new
    
    respond_to do |format|
      format.html #new.html.erb
      format.json { render :json => @user }
    end
  end
end