# spec/factories/leads.rb
require 'faker'

FactoryGirl.define do
  factory :lead do |f|
    f.name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.company_id { rand(1000) }
  end

  factory :invalid_lead, parent: :lead do |f|
  	f.name nil
  end
end