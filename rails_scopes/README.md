# Rails Scopes

A gem that wraps up some meta programmed scopes generators. This gem is an attempt to put together useful code generation for active records common scopes. 

Note: For now, as it is just a POC, it works with 2 different scopes generators: 
  1. Combiner :arrow_right: that aims to create scopes based on hashs, like, status for a state machine.
  2. Dates :arrow_right: for "less than equal", "greater than equal" and between

## Installation

Add this line to your application's Gemfile:

    gem 'rails_scopes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_scopes

## Usage

As it relies on metaprogramming you just need to extend your active record

### Example code for combiner

```ruby
class Example < ActiveRecord::Base
  extend RailsScopes::ScopesCombiner

  enum status: { active: 22, inactive: 14, running: 32 }
  combine_scopes_for_attribute :status, statuses

end

```
```
Scopes:
  active_or_inactive
  active_or_running
  inactive_or_running
  active_or_inactive_or_running
```

### Example code for dates

```ruby
class Example < ActiveRecord::Base
  extend RailsScopes::DateScopes

  create_date_scopes_for [ :payment_date ]

  end
end
```
```
Scopes:
  payment_date_between(start_date, end_date)
  payment_date_less_equal_than(date)
  payment_date_greater_equal_than(date)
```

## Contributing to Rails Scopes
* Pull requests with unit tests or specs and a version branch are welcomed.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push as much as you want.
* Make sure to add tests for it. 
