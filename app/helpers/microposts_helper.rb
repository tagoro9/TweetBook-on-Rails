# -*- encoding : utf-8 -*-
module MicropostsHelper

  def wrap(content)
    raw(content.split.map{ |s| wrap_long_string(s) }.join(' '))
  end
  
  def any_url (text)
    content = text.clone
    params = Hash.new
    url = content.scan(/(?:http:\/\/)?www\.\w+.\S+/)
    url.each do |a|
      http = a.sub(/http:\/\//,"")
      http.gsub!("&#8203;","")
      link = "<a href=\"http:\/\/#{http}\"> #{wrap_long_string(http)} </a>"
      content.sub!(a,link)    
      (params[:video]  = "http:\/\/"+http) if (http.match(/www.youtube.com/)) != nil
      (params[:imagen] = "http:\/\/"+http) if (http.match(/\www\.\w+.\S+.jpe?g/)) != nil
    end
    [content,params]
  end
  
  def wrap_mentions text
    content = text.clone
    mentions = content.scan(/(?:^|\s)@(\w*[a-zA-Z_]+\w*)/).flatten.uniq
    mentions.each do |a|
      content.gsub!("@#{a}",link_to_identity(a))
    end
    content
  end

  private
  
    def wrap_long_string(text, max_width = 30)
      zero_width_space = "&#8203;"
      regex = /.{1,#{max_width}}/
      (text.length < max_width) ? text : 
                                  text.scan(regex).join(zero_width_space)
    end
end
