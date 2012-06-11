# -*- encoding : utf-8 -*-

=begin
 TODO campo descripcion en el usuario
 TODO pagina usuarios quitar lalalalalala
 TODO bordes redondeados en imagenes de microposts
 TODO estilos al mostrar los usuarios
 TODO arreglar contador al responder
 TODO Hacer readme en github
 TODO corregir field_with_errors css al registrarse de forma incorrecta
 TODO arreglar seguidores y siguiendo en el perfil, se salta de linea
 TODO evitar XSS en video e imagenes del feed
 TODO replicar codigo imagenes y videos al perfil
 TODO Modal con atajos de teclado
 TODO mostrar identity en todas partes
 TODO detectar menciones (@identity)
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
    rescue_from Exception, with: :render_500
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
