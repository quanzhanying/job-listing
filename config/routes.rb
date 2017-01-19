Rails.application.routes.draw do
  devise_for :users

  resources :jobs
  root 'welcome#index'
end
