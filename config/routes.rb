Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :groups
  end

  resources :groups
  root 'groups#index'
end
