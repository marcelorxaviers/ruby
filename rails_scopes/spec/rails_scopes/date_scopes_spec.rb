require 'spec_helper'
 
describe RailsScopes::DateScopes do

  let(:example1) do
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

  let(:example2) do
    class Example
      extend RailsScopes::DateScopes

      create_between_scope :payment_date, :payment_between
      create_less_equal_scope :payment_date, :payment_end
      create_greater_equal_scope :payment_date, :payment_start

      self
    end
  end

  describe "RailsScopes::DateScopes" do
  
    it "extends DateScopes" do
      example1.should respond_to :date_scopes_names
      example1.should respond_to :create_between_scope
      example1.should respond_to :create_date_scopes_for
      example1.should respond_to :create_less_equal_scope
      example1.should respond_to :create_greater_equal_scope
    end
 
    it "creates scopes for dates" do
      example1.date_scopes_names(example1.dates).each do |name|
        example1.should respond_to name
      end
    end

    it "create scope for between" do
      example2.should respond_to :payment_between
    end

    it "create scope for less/equal" do
      example2.should respond_to :payment_end
    end

    it "create scope for greater/equal" do
      example2.should respond_to :payment_start
    end
 
  end
 
end
