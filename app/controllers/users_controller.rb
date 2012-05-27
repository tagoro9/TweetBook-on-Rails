# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def index
    @title = "Usuarios"
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
    @micropost = Micropost.new
    @title = @user.name + " - Perfil"
    respond_to do |format|
      format.html
      format.js   
    end   
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido a TweetBook"
      redirect_to @user
    else
      @title = "Sign up"
      #redirect_to '/signup'
      render 'new'
    end    
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  def edit 
    @title = "Configurar"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @micropost = Micropost.new if signed_in?
    @users = @user.following.paginate(:page => params[:page])
    #render 'show_follow'
    respond_to do |format|
      format.html { render 'show' }
      format.js
    end    
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @micropost = Micropost.new if signed_in?
    @users = @user.followers.paginate(:page => params[:page])
    #render 'show_follow'
    respond_to do |format|
      format.html { render 'show' }
      format.js
    end   
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
  
end
