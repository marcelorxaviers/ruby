Rails.application.routes.draw do

  resources :suppliers do
    resources :comments
  end

end
