class ErroresController < ApplicationController
  def error404
    @title = '?'
    @errorPage = params[:not_found]
  end

  def error500
  end

end
