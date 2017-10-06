Rails.application.routes.draw do
  root 'jobs#index'
  resources :jobs
  devise_for :users

  namespace :admin do
    resources :jobs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
