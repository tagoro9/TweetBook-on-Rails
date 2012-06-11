# -*- encoding : utf-8 -*-
require 'spec_helper'

describe 'Errors control' do
  
  describe 'error 404' do
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
    
  end
  
end
