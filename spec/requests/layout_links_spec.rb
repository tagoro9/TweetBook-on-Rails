# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "LinksDePaginas" do    
    
  it "Deberia tener una pagina inicial en '/'" do
    get '/'
    response.should have_selector('title', :content => "Inicio")
  end
  
  it "Deberia tener una pagina de preguntas frecuentes '/faq'" do
    get '/faq'
    response.should have_selector('title', :content => "FAQ")
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => profile_path,
                                         :content => "Perfil")
    end
    
    it "should be able to access the profile page" do
      visit profile_path
      response.should have_selector "title",:content => @user.name
    end
    
    it "should be able to access the users list" do
      visit users_path
      response.should have_selector "title",:content => "Usuarios"
    end
    
  end
end
