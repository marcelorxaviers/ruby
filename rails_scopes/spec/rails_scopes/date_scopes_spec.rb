require 'spec_helper'
 
describe RailsScopes::DateScopes do

  let(:example) do 
    class Example
      extend RailsScopes::DateScopes

      @dates = [ :payment_date, :expiration_date, :period_start ]

      class << self
        attr_reader :dates
      end
      
      create_date_scopes_for dates
      self
    end
  end

  describe "RailsScopes::DateScopes" do
  
    it "extends DateScopes" do
      example.should respond_to :date_scopes_names
    end
 
    it "creates scopes for dates" do
      example.date_scopes_names(example.dates).each do |name|
        example.should respond_to name
      end
    end
 
  end
 
end
