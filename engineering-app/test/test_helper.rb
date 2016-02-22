ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require "webmock/minitest"


require File.expand_path "../../app.rb", __FILE__