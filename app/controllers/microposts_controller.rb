# -*- encoding : utf-8 -*-
class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy, :destroy]
  before_filter :authorized_user, :only => :destroy
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      #Detectar menciones
      find_mentions(@micropost.content).each do |mention|
        UserMailer.mention_email(User.find_by_identity(mention),current_user).deliver
      end
      flash[:success] = "Micropost creado!"
      redirect_to :back
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to :back
  end

  private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end
