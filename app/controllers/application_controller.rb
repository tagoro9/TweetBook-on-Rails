# -*- encoding : utf-8 -*-

=begin
<<<<<<< HEAD
=======
 TODO Hover sobre esquinita microposts!
<<<<<<< HEAD
<<<<<<< HEAD
=======
 TODO al iniciar sesion redirigir al home
 TODO pagina usuarios quitar lalalalalala
>>>>>>> c9995bae9b3ff9e13191f4f8f3945a7fbb01744b
=======
>>>>>>> 689e06f607cfc54da836f33246a065ef87a475b8
 TODO estilos al mostrar los usuarios
 TODO Hacer readme en github
 TODO Editar usuario sin cambiar contraseña
 TODO Modal con atajos de teclado
 
 
 
 TODO pusher
 TODO Hacer memoria
 TODO Hacer presentacion
  
=end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include MicropostsHelper
  
  #unless Rails.application.config.consider_all_requests_local
    #rescue_from Exception, with: :render_500
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from ActionController::UnknownAction, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #end
  
  
  private
  
  def render_404(exception)
    @errorPage = 'esta página'
    @errorMessage = exception.message
    @title = '?'
    respond_to do |format|
      format.html { render template: 'errores/error404', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def render_500(exception)
    @errorPage = exception
    @title = 'Ups!'
    respond_to do |format|
      format.html { render template: 'errores/error500', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end    
end
