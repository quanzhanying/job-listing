Rails.application.routes.draw do
  devise_for :users
  resources :jobs
  namespace :admin do
    resources :jobs
  end
  root 'welcome#index'
end
