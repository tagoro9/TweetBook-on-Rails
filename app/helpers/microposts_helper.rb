# -*- encoding : utf-8 -*-
module MicropostsHelper

  require "uri"
  
  def wrap(content)
    raw(content.split.map{ |s| wrap_long_string(s) }.join(' '))
  end
  
  def any_url (text)
    content = text.clone
    params = Hash.new
    url = URI.extract(content)
    url.each do |a|
      link = "<a href=\"#{a}\"> #{a.sub(/https?:\/\//,"").slice!(0..30)} </a>"
      content.sub!(a,link)    
      (params[:video]  = a) if (a.match(/youtube/)) != nil
      (params[:imagen] = a) if (a.match(/(jpe?g$)|(.png$)/i)) != nil
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

  def find_mentions text
    text.scan(/(?:^|\s)@(\w*[a-zA-Z_]+\w*)/).flatten.uniq
  end

  private
  
    def wrap_long_string(text, max_width = 30)
      if(text.match(/href=/) == nil)
        zero_width_space = "&#8203;"
        regex = /.{1,#{max_width}}/
        return (text.scan(regex).join(zero_width_space)) if (text.length > max_width)
      end
      text
    end
    
end
