# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "zoho_wrapper"
  spec.version       = "0.0.6"
  spec.authors       = ["marcelorxs"]
  spec.email         = ["marcelorxs@gmail.com"]
  spec.summary       = "A gem for accessing Zoho CRM API"
  spec.description   = "A rubyzoho wrapper that allows Zoho CRM API access."
  spec.homepage      = "http://github.com/marcelorxaviers/zoho_wrapper"
  spec.license       = "MIT"
  spec.platform              = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 1.9.3"
  spec.files         = `git ls-files -z`.split("\x0")

  spec.require_paths = ["lib"]
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 0"
  spec.add_development_dependency "rspec", "~> 0"
  spec.add_development_dependency "rubyzoho", "~> 0.2.0"
  spec.add_dependency "rubyzoho", "~> 0.2.0"
end