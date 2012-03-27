# encoding: utf-8
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
                                  :name => 'username')
        form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                  :type => 'password',
                                  :name => 'passw')
        form.should have_selector('input',          # Casilla para hacer que la sesión no caduque al cerrar
                                  :type => 'checkbox',
                                  :content => 'Recordar contraseña')
        form.should have_selector('input',          # Botón para entrar en la pagina
                                  :type => 'submit',
                                  :value => 'Entrar')
      end
      response.should have_selector('form', :id => 'login') do |form|
        # Debe tener un formulario para crear una cuenta nueva con los campos:
        form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                  :type => 'text',
                                  :name => 'nombre_completo')
        form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                  :type => 'text',
                                  :name => 'email')
        form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                  :type => 'password',
                                  :name => 'passw')
        form.should have_selector('input',          # Botón para enviar los datos y darse de alta
                                  :type => 'submit',
                                  :value => 'Registrar')
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
