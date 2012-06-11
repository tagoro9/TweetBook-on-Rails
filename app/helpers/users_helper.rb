# -*- encoding : utf-8 -*-
module UsersHelper
  def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.name),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
  
  def link_to_identity(identity)
    path = User.find_by_identity(identity) || root_path
    link_to "@#{identity}",path
  end
  
end
