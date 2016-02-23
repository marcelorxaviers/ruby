require 'spec_helper'
 
describe RailsScopes::ScopesCombiner do
	let(:example) do 
	  class Example
  	  extend RailsScopes::ScopesCombiner

  	  @statuses = { active: 22, inactive: 14, running: 32, stuck: 42, waiting: 465, dunno: 4880 }
      class << self
        attr_reader :statuses
      end
      
  	  combine_scopes_for_attribute :status, statuses
      self
    end
	end

	describe "RailsScopes::ScopesCombiner" do
	
	  it "extends ScopesCombiner" do
      example.should respond_to :combined_methods_names
    end
 
    it "creates methods for statuses" do
      example.combined_methods_names(example.statuses).each do |name|
        example.should respond_to name
      end
    end
 
	end
 
end
