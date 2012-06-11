# -*- encoding : utf-8 -*-
module MicropostsHelper

  def wrap(content)
    sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end
  
  def any_url (text)
    content = text.clone
    params = Hash.new
    url = content.scan(/(?:http:\/\/)?\www\.\w+.\S+/)
    url.each do |a|
      http = a.sub(/http:\/\//,"")
      link = "<a href=\"http:\/\/#{http}\"> #{http} </a>"
      content.sub!(a,link)    
      (params[:video]  = "http:\/\/"+http) if (http.match(/www.youtube.com/)) != nil
      (params[:imagen] = "http:\/\/"+http) if (http.match(/\www\.\w+.\S+.jpe?g/)) != nil
    end
    [content,params]
  end

  private
  
    

    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
end
