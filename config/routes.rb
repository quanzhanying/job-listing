Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  root 'jobs#index'

  namespace :admin do
    resources :jobs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
