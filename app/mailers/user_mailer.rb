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
  
  def mention_email(user,mentioner)
    @user = user
    @mentioner = mentioner
    mail(:to => user.email, :subject => "@#{mentioner.identity} te ha mencionado en TweetBook")
  end
  
end
