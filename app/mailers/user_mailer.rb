class UserMailer < ActionMailer::Base
  default :from => "noreply@tweetbookonrails.com"
  
  def welcome_email(user)
    @user = user
    mail(:to => user.email, :subject => "Bienvenido a TweetBook")
  end  
  
  def following_email(user,follower)
    @user = user
    @follower = follower
    mail(:to => user.email, :subject => "@#{follower.identity} te sigue en TweetBook")
  end
  
end
