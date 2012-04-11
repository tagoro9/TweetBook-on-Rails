module ApplicationHelper
  def header
    if @title == "Inicio"
      render 'layouts/login_header'
    else
      render 'layouts/header'
    end
  end
  
  def footer
    if @title == "Inicio"
      render 'layouts/login_footer'
    else
      render 'layouts/footer'
    end
  end
end
