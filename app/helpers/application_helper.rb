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
  
  def logo
    image_tag("logo.png", :alt => "TweetBook", :class => "round")
   end
end
