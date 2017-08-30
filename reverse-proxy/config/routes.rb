Rails.application.routes.draw do
  root to: "rules#index"

  # This are the rules routes
  resources :rules


  # I want the same app to handle both domains to make it easier to run the solution
  # That's why the following routes look so similar:
  
  # This route handles the new domain requests
  get '/*any', to: 'reverse_proxy#render_now', constraints: DomainConstraint.new
  
  # This route handles the redirects
  get '/*any', to: 'reverse_proxy#redirect'
end
