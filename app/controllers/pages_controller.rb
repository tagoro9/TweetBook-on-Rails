class PagesController < ApplicationController
  def login
    @title = "Inicio"
    @user = User.new
  end  
  
  def signup
    
  end
  
  def faq
    @title = "FAQ"
  end
  
  def cuenta
    @title = "Cuenta"
  end
  
end
