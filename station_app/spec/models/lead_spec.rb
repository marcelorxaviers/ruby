# spec/models/lead.rb
require 'spec_helper'

describe Lead do

  it "has a valid factory" do
    FactoryGirl.create(:lead).should be_valid
  end
  
  it "has associations as" do
  	FactoryGirl.create(:lead).should belong_to(:company)
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:lead, name: nil).should_not be_valid
  end

  it "is invalid with a blank name" do
  	FactoryGirl.build(:lead, name: "").should_not be_valid
  end
  
  it "is invalid without a last name" do
  	FactoryGirl.build(:lead, last_name: nil).should_not be_valid
  end

  it "is invalid with a blank last name" do
  	FactoryGirl.build(:lead, last_name: "").should_not be_valid
  end
  
  it "is invalid without an email" do
  	FactoryGirl.build(:lead, email: nil).should_not be_valid
  end
  
  it "is invalid without a company_id" do
  	FactoryGirl.build(:lead, company_id: nil).should_not be_valid
  end
  
  it "does not allow duplicate lead emails" do
  	FactoryGirl.create(:lead, email: "lead@only.one")
  	FactoryGirl.build(:lead, email: "lead@only.one").should_not be_valid
  end

  it "returns a lead's full name as a string" do
    lead = FactoryGirl.create(:lead, name: "John", last_name: "Doe")
    lead.full_name.should == "John Doe"
  end

  it "returns a zoho lead's object" do
    lead = FactoryGirl.create(:lead)
    zoho_lead = lead.zoho_lead
    zoho_lead[:first_name].should == lead.name
    zoho_lead[:last_name].should == lead.last_name
    zoho_lead[:title].should == lead.job_title
    zoho_lead[:email].should == lead.email
  end

  it "returns a zoho token" do
    company = FactoryGirl.create(:company)
    lead = FactoryGirl.create(:lead, company: company)
    zoho_lead = lead.zoho_token
    zoho_lead.should == lead.company.zoho_token
  end

end