Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :resumes
    end
  end

  resources :jobs do
    resources :resumes
  end

  root 'welcome#index'
end
