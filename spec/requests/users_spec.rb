# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Users" do

  describe "signup_index" do

    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit root_path
          fill_in "user_name",         :with => "pepe"
          fill_in "user_email",        :with => "pepe@gmail.com"
          fill_in "user_password",     :with => "123"
          fill_in "user_password_confirmation", :with => "12331"
          click_button "Registrar"
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
          response.should have_selector('form', :id => 'new_user') do |form|
                # Debe tener un formulario para crear una cuenta nueva con los campos:
                form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                          :type => 'text',
                                          :id => 'user_name',
                                          :value => "pepe")
                form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                          :type => 'text',
                                          :id => 'user_email',
                                          :value => "pepe@gmail.com")
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :id => 'user_password')
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :id => 'user_password_confirmation')
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
          visit root_path
          fill_in "user_name",         :with => "Example User"
          fill_in "user_email",        :with => "user@example.com"
          fill_in "user_password",     :with => "foobar"
          fill_in "user_password_confirmation", :with => "foobar"
          click_button "Registrar"
          response.should have_selector("div.alert-success",
                                        :content => "Bienvenido a TweetBook")
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
          fill_in "user_name",         :with => "pepe"
          fill_in "user_email",        :with => "pepe@gmail.com"
          fill_in "user_password",     :with => "123"
          fill_in "user_password_confirmation", :with => "12331"
          click_button "user_submit"
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
          response.should have_selector('form', :id => 'new_user') do |form|
                # Debe tener un formulario para crear una cuenta nueva con los campos:
                form.should have_selector('input',          # Caja de texto para introducir nombre de usuario
                                          :type => 'text',
                                          :id => 'user_name',
                                          :value => "pepe")
                form.should have_selector('input',          # Caja de texto para introducir la dirección de correo
                                          :type => 'text',
                                          :id => 'user_email',
                                          :value => "pepe@gmail.com")
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :id => 'user_password',
                                          :type => 'password')
                form.should have_selector('input',          # Caja de texto para introducir la contraseña
                                          :type => 'password',
                                          :id => 'user_password_confirmation')
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
          fill_in "user_name",         :with => "Example User"
          fill_in "user_email",        :with => "usera@example.com"
          fill_in "user_password",     :with => "foobar"
          fill_in "user_password_confirmation", :with => "foobar"
          click_button "user_submit"
          response.should have_selector("div.alert-success",
                                        :content => "Bienvenido a TweetBook")
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end

  describe "sign in/out" do

    describe "failure" do
      it "should not sign a user in" do
        visit signin_path
        fill_in :email,    :with => ""
        fill_in :password, :with => ""
        click_button
        response.should have_selector("div.alert-error", :content => "incorrecto")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        visit signin_path
        fill_in :email,    :with => user.email
        fill_in :password, :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
    end
  end

end
