Rails.application.routes.draw do
  devise_for :users
  root 'jobs#index'

  resources :jobs

  namespace :admin do
    resources :jobs
  end
end
