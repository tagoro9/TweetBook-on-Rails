class PagesController < ApplicationController
  def login
    @title = "Inicio"
    redirect_to current_user unless !signed_in?
    @user = User.new
  end  
  
  def signup
    
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
    @title = "Help"
  end
  
end
