# spec/factories/leads.rb
require 'faker'

FactoryGirl.define do
  factory :company do |f|
  	f.name { Faker::Company.name[0..29] }
    f.zoho_token { Faker::Number.number(30) }
  end

  factory :invalid_company, parent: :company do |f|
  	f.name nil
  end
end