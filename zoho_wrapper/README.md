# Zoho Wrapper

A gem that wraps up the rubyzoho gem. This gem makes possible to use rubyzoho with more than just one company. It changes the Zoho Token whenever a save operation or a remove operation is called. 

Note: For now, as it is a POC, it is just working with the Lead (Zoho) entity.

## Installation

Add this line to your application's Gemfile:

    gem 'zoho_wrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zoho_wrapper

## Usage

There are just few integration configurations before using the gem. The class intended to integrate with the gem needs to include our `Lead` module. So, the class must implement the following methods:

- zoho_lead: that returns the zoho fields to be saved ( see https://github.com/amalc/rubyzoho )
- zoho_token: The token for connecting with the Zoho account. For more information on how to get a Zoho Authentication Token see https://www.zoho.com/crm/help/api/using-authentication-token.html.

### Example code

```ruby
class Lead < ActiveRecord::Base
  include ZohoWrapper::ActiveRecord

  belongs_to :company

  validates :name, :length => { :minimum => 3, :maximum => 60}, :presence => true, :allow_blank => false
  validates :last_name, :length => { :minimum => 3, :maximum => 60}, :presence => true, :allow_blank => false
  validates :email, :presence => true
  validates :company_id, :presence => true

  def fullname
    "#{name} #{last_name}"
  end

  def zoho_lead
    {
      :first_name => name.dup,
      :last_name => last_name.dup,
      :title => job_title.dup,
      :email => email.dup
    }
  end

  def zoho_token
    company.zoho_token
  end
```

### Sample (Station App)

An application using the gem is available at:

- Source code: https://github.com/marcelorxaviers/station_app
- Running app: https://station-app.herokuapp.com

## Contributing to Zoho Wrapper
* Pull requests with unit tests or specs and a version branch are welcomed.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push as much as you want.
* Make sure to add tests for it. 
