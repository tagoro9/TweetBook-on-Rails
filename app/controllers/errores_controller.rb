class ErroresController < ApplicationController
  def error404
    @title = '?'
    @errorPage = params[:not_found]
  end

  def error500
    @title = 'Ups!'
  end
  
  def raise500
    raise 'Error 500 forzado'
  end

end
