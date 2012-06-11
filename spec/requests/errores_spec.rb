# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Errors control' do
  
  describe 'error 404' do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :session_email,    :with => @user.email
      fill_in :session_password, :with => @user.password
      click_button
    end    
    
    it 'should render 404 when I visit a fake url' do
      get '/noExisto'
      response.should have_selector "title", :content => '?'
      response.should have_selector "h1", :content => 'noExisto'
    end
    
    it 'should render 404 when an error is produced' do      
      get '/users/1000'
      response.should have_selector "title", :content => '?'
      response.should have_selector "h1", :content => 'página'
    end
    
  end
  
  describe 'error500' do
    it 'should render error 500 pages when a server error occurs' do
      get 'errores/raise500' #lanza un error 500
      response.should have_selector "title", :content => 'Ups!'
      response.should have_selector "h1", :content => "no estamos"
    end
  end
  
end
