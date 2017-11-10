Rails.application.routes.draw do

  resources :locations, only: [:index]
  resources :vehicles do
    resources :locations, only: [:create, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
