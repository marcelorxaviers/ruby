StationApp::Application.routes.draw do
  root to: "leads#index"

  resources :companies

  resources :leads

  resources :leads do
    get "zoho_add"
    get "zoho_remove"
  end

  devise_for :users
end
