Rails.application.routes.draw do
  devise_for :users
  root 'jobs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :jobs

  namespace :admin do
    resources :jobs
  end
end
