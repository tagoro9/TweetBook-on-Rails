# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActionController::UnknownAction, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  def render_404
    if /(jpe?g|png|gif)/i === request.path
      render :text => "404 Not Found", :status => 404
    else
      render :template => "shared/404", :layout => false, :status => 404
    end
  end
  
  
  
end
