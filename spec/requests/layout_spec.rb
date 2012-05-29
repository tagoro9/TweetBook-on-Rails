# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "PresenciaDePaginas" do
  describe "GET /" do
    it "Deberia tener una pagina inicial" do
      get '/'
      response.status.should be(200)
      response.should have_selector('title', :content => "Inicio") # <title>Inicio</title>
      response.should have_selector('form', :id => 'login') do |form|
        # Debe tener un formulario para hacer login con los campos:
        form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                  :type => 'text',
                                  :id => 'session_email')
        form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                  :type => 'password',
                                  :id => 'session_password')
        form.should have_selector('input',          # Casilla para hacer que la sesión no caduque al cerrar
                                  :type => 'checkbox',
                                  :name => 'recordar')
        form.should have_selector('label',
                                  :for => 'recordar',
                                  :content => 'Recordar contraseña')
        form.should have_selector('input',          # Botón para entrar en la pagina
                                  :type => 'submit',
                                  :value => 'Entrar')
      end
      response.should have_selector('form', :id => 'new_user') do |form|
        # Debe tener un formulario para crear una cuenta nueva con los campos:
        form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                  :type => 'text',
                                  :id => 'user_name')
        form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                  :type => 'text',
                                  :id => 'user_email')
        form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                  :type => 'password',
                                  :id => 'user_password')
        form.should have_selector('input',          # Caja de texto para introducir la confirmacion de la contraseña
                                  :type => 'password',
                                  :id => 'user_password_confirmation')                                  
        form.should have_selector('input',          # Botón para enviar los datos y darse de alta
                                  :type => 'submit',
                                  :value => 'Registrar')
      end
    end
  end
  
  describe 'It should have a footer' do
    
    before(:each) do
      visit root_path
    end    
    
    describe 'when not signed in' do
        it "should contain a list of links" do
          response.should have_selector("div",:class => "footer inline-list") do |content|
            content.should have_selector("ul")
          end
        end
    end
    
    describe 'when signed in' do
      before(:each) do
        @user = Factory(:user)
        fill_in :session_email,    :with => @user.email
        fill_in :session_password, :with => @user.password
        click_button  
      end
      it "should contain a list of links" do
        response.should have_selector("div",:id => "footer") do |content|
          content.should have_selector("ul")
        end
      end
    end
  end
  
  describe "GET /faq" do
    it "Deberia tener una pagina de preguntas frecuentes" do
      get '/faq'
      response.status.should be(200)
      response.should have_selector('title', :content => "FAQ")
    end
  end
  
  describe "GET /cuenta" do
    it "Deberia tener una pagina para configurar las cuentas" do
      # Aunque de un error por no haber iniciado sesión
      get '/cuenta'
      response.status.should be(200)
      response.should have_selector('title', :content => "Cuenta")
    end
  end
end
