require_relative '../lib/rails_scopes/scopes_combiner'
require_relative '../lib/rails_scopes/date_scopes'

require 'pry'
require 'yaml'

RSpec.configure do |config|
	config.expect_with(:rspec) { |c| c.syntax = :should }
end