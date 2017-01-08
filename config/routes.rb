Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  root 'jobs#index'
  #root 'welcome#index'

  namespace :admin do
    resources :jobs
  end
end
