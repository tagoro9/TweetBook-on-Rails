require 'spec_helper'

describe "LinksDePaginas" do    
    
  it "Deberia tener una pagina inicial en '/'" do
    get '/'
    response.should have_selector('title', :content => "Inicio")
  end
  
=begin
  
  it "deberia tener una pagina home en '/home'" do
    get '/home'
    response.should have_selector('title', :content => "Home")
  end
  
  it "deberia tener una pagina de usuarios en '/usuarios'" do
    get '/users'
    response.should have_selector('title', :content => "Usuarios")
  end

  it "Deberia tener una pagina cuenta en '/cuenta'" do
    get '/profile'
    response.should have_selector('title', :content => "Cuenta")
  end
  
=end

  it "Deberia tener una pagina de preguntas frecuentes '/faq'" do
    get '/faq'
    response.should have_selector('title', :content => "FAQ")
  end

=begin
    describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Sign in")
    end
  end
=end

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
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Perfil")
    end
  end
end