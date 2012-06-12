# -*- encoding : utf-8 -*-
module UsersHelper
  def gravatar_for(user, options = { :size => :thumb })
    
    classes = 'gravatar'
    classes += " thumb" if (user.avatar.url(options[:size]) =~ /NoImage\.png/i) && (options[:size] == :thumb)
    classes += " mini" if (user.avatar.url(options[:size]) =~ /NoImage\.png/i) && (options[:size] == :mini)
    image_tag user.avatar.url(options[:size]), :alt => h(user.name), :class => classes
    #"#{classes} -- #{user.avatar.url(options[:size])}"
    
    #gravatar_image_tag(user.email.downcase, :alt => h(user.name), :class => 'gravatar', :gravatar => options)
  end
  
  def link_to_identity(identity)
    path = User.find_by_identity(identity) || root_path
    link_to "@#{identity}",path
  end
  
end
