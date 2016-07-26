Rails.application.routes.draw do
  devise_for :admins

  resources :jobs

  namespace :admin do
  	resources :jobs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'jobs#index'
end
