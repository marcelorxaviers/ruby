Rails.application.routes.draw do

  post 'api/ember/auth', to: 'application#ember_auth'

  mount_devise_token_auth_for 'User', at: 'api/auth'

  namespace :api do
    get 'users/roles', to: 'users#roles'
    resources :users
    resources :meals
  end

end
