# -*- encoding : utf-8 -*-

=begin
 TODO Hover sobre esquinita microposts!
 TODO al iniciar sesion redirigir al home
 TODO poner foco al darle a neuvo tweet
 TODO pagina usuarios quitar lalalalalala
 TODO estilos al mostrar los usuarios
 TODO al borrar un tweet si es desde el home, redirigirlo al home
 TODO arreglar contador al responder
 TODO Hacer readme en github
 TODO terminar lo de similares a ti
 TODO Editar usuario sin cambiar contraseña
 TODO corregir field_with_errors css al registrarse de forma incorrecta
 TODO Modal con atajos de teclado
 TODO action mailer
 TODO pusher
 TODO rmagick e imagenes de perfil
 TODO Hacer memoria
 TODO Hacer presentacion
  
=end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
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
