Rails.application.routes.draw do
  resources :products do
    get :products
    get 'new', to: 'products#new', :as => :new
    get '/pay', to: 'products#pay', :as => :pay
    put '/buy', to: 'products#buy', :as => :buy
  end

  put 'withdraw', to: 'machine#withdraw', :as => :withdraw
  put 'refill', to: 'machine#refill', :as => :refill
    
  root to: "products#index"
end
