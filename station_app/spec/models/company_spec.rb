# spec/models/company.rb
require 'spec_helper'

describe Company do

  it "has a valid factory" do
    FactoryGirl.create(:company).should be_valid
  end
  
  it "has associations as" do
    company = FactoryGirl.create(:company)
    company.should belong_to(:user)
    company.should have_and_belong_to_many(:users)
    company.should have_many(:leads)
  end

  it "is invalid without a name" do
    FactoryGirl.build(:company, name: nil).should_not be_valid
  end

  it "is invalid with a blank name" do
    FactoryGirl.build(:company, name: "").should_not be_valid
  end

  it "is invalid with a name with length less than 3 characters" do
    FactoryGirl.build(:company, name: "Jo").should_not be_valid
  end

  it "is invalid with a name with length greater than 30 characters" do
    FactoryGirl.build(:company, name: "@"*31).should_not be_valid
  end

   it "is invalid without a zoho token" do
    FactoryGirl.build(:company, zoho_token: nil).should_not be_valid
  end

  it "is invalid with a blank zoho token" do
    FactoryGirl.build(:company, zoho_token: "").should_not be_valid
  end

  it "is invalid with a zoho token with length less than 30 characters" do
    FactoryGirl.build(:company, zoho_token: "@"*29).should_not be_valid
  end

  it "is invalid with a zoho token with length greater than 35 characters" do
    FactoryGirl.build(:company, zoho_token: "@"*36).should_not be_valid
  end

end