Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :jobs do
    resources :resumes
  end

  root 'jobs#index'
end
