require 'spec_helper'

describe "Users" do

  describe "signup_index" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit root
          fill_in "Name",         :with => "pepe"
          fill_in "Email",        :with => "pepe@gmail.com"
          fill_in "Password",     :with => "123"
          fill_in "Confirmation", :with => "12331"
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
          response.should have_selector('form', :id => 'signup') do |form|
                # Debe tener un formulario para crear una cuenta nueva con los campos:
                form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                          :type => 'text',
                                          :name => 'name',
                                          :value => "pepe")
                form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                          :type => 'text',
                                          :name => 'email',
                                          value => "pepe@gmail.com")
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :name => 'password')
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :name => 'password_confirmation')
                form.should have_selector('input',          # Botón para enviar los datos y darse de alta
                                          :type => 'submit',
                                          :value => 'Registrar')
              end
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do

      it "should make a new user" do
        lambda do
          visit root
          fill_in "Name",         :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
    
  end
  
  
  describe "signup" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => "pepe"
          fill_in "Email",        :with => "pepe@gmail.com"
          fill_in "Password",     :with => "123"
          fill_in "Confirmation", :with => "12331"
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
          response.should have_selector('form', :id => 'signup') do |form|
                # Debe tener un formulario para crear una cuenta nueva con los campos:
                form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                          :type => 'text',
                                          :name => 'name',
                                          :value => "pepe")
                form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                          :type => 'text',
                                          :name => 'email',
                                          value => "pepe@gmail.com")
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :name => 'password')
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :name => 'password_confirmation')
                form.should have_selector('input',          # Botón para enviar los datos y darse de alta
                                          :type => 'submit',
                                          :value => 'Registrar')
              end
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => "Example User"
          fill_in "Email",        :with => "user@example.com"
          fill_in "Password",     :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Welcome")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
    
  end
  
end