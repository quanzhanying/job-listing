Rails.application.routes.draw do
  devise_for :users
  resources :jobs do
    member do
      post :admin
    end
  end
  root 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
