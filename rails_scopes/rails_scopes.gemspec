# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rails_scopes"
  spec.version       = "0.0.3"
  spec.authors       = ["marcelorxs"]
  spec.email         = ["marcelorxs@gmail.com"]
  spec.summary       = "A gem for generating rails active record common scopes"
  spec.description   = "A set of scopes generators."
  spec.homepage      = "http://github.com/marcelorxaviers/ruby/rails_scopes"
  spec.license       = "MIT"
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.1.5"
  spec.files         = `git ls-files -z`.split("\x0")

  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 0"
  end