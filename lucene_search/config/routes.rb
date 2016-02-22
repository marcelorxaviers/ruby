Rails.application.routes.draw do
  resources :recipes, except: [:new, :edit]
  post :search, to: "recipes#search", as: "search"
end
