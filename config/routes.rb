Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :groups do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :groups
  root 'groups#index'
end
