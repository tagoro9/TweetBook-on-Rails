# -*- encoding : utf-8 -*-
# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.identity              "MichaelHartl"
  user.desc                  "Soy un Factory User"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :name do |n|
  "Person #{n}"
end

Factory.sequence :identity do |n|
  "Person#{n}"
end

Factory.sequence :desc do |n|
  "I'm person#{n}'s desc!"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end
