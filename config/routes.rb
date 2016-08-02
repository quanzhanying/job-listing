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

  resources :groups do
    resources :resumes
  end
  root 'groups#index'
end
