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
  
end