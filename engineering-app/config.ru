require "./init"
require "./app"
use Rack::Attack if ENV['RACK_ENV'] == "production"
run EngineeringApp