Rails.application.routes.draw do
  namespace :admin do
    resources :jobs
  end
  resources :jobs
  root 'jobs#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
