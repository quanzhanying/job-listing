Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  root 'jobs#index'
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
