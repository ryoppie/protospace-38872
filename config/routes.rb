Rails.application.routes.draw do
  devise_for :users
 root to: "prototypes#index"
 resources :users
  resources :new_prototypes do
  end
end
