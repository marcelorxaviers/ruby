# spec/factories/users.rb
require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password 'passphrase'
    f.password_confirmation 'passphrase'
  end
end