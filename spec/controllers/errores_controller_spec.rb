require 'spec_helper'

describe ErroresController do

  describe "GET 'error404'" do
    it "when I go to a fake url it should be successful" do
      get 'error404'
      response.should be_success
    end
  end

  describe "GET 'error500'" do
    it "should be successful" do
      get 'error500'
      response.should be_success
    end
  end

end
