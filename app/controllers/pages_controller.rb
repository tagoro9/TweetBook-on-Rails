# -*- encoding : utf-8 -*-
class PagesController < ApplicationController  
  def home
    if signed_in?
      @title = current_user.name + " - Home"
      @micropost = Micropost.new if signed_in?
      @feed_items = current_user.feed.paginate(:page => params[:page])
    else
      @title = "Inicio"
      @user = User.new
      render 'pages/login'
    end
  end
  
  def signup
    @title = "Regístrate"
  end
  
  def about
    @title = "Sobre nosotros"
  end
  
  def faq
    @title = "FAQ"
  end
  
  def cuenta
    @title = "Cuenta"
  end
  
  def help
    @title = "Ayuda"
  end
  
  def prezi
    @title = "Prezi"
  end
  
end
