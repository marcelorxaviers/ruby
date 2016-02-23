require_relative '../lib/rails_scopes/scopes_combiner'
 
require 'yaml'

RSpec.configure do |config|
	config.expect_with(:rspec) { |c| c.syntax = :should }
end