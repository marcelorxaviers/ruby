# Zoho Wrapper

A gem that wraps up some meta programmed scopes generators. This gem is an attempt to put together useful code generation for active records common scopes. 

Note: For now, as it is a POC, it is just working with scopes combiner that aims to create scopes based on hashs, like, status for a state machine.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_scopes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_scopes

## Usage

As it relies on metaprogramming 

### Example code

```ruby
class Example < ActiveRecord::Base
  extend RailsScopes::ScopesCombiner

  enum status: { active: 22, inactive: 14, running: 32, stuck: 42, waiting: 465, dunno: 4880 }
  combine_scopes_for_attribute :status, statuses

end
```

## Contributing to Rails Scopes
* Pull requests with unit tests or specs and a version branch are welcomed.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push as much as you want.
* Make sure to add tests for it. 
