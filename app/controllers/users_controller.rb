class UsersController < ApplicationController
  
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Bienvenido a TweetBook"
      redirect_to @user
    else
      @title = "Sign up"
      #redirect_to '/signup'
      render 'new'
    end    
  end
  
end
