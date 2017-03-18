Rails.application.routes.draw do
  resources :cities
  devise_for :users
  resources :jobs do
    resources :resumes
  end
  namespace :qianduan do
    resources :jobs
  end
  namespace :houduan do
    resources :jobs
  end
  namespace :quanzhan do
    resources :jobs
  end
  namespace :chanpin do
    resources :jobs
  end
  namespace :mishu do
    resources :jobs
  end
  namespace :shouhou do
    resources :jobs
  end
  namespace :yunxing do
    resources :jobs
  end
  namespace :ceshi do
    resources :jobs
  end
  root 'welcome#index'
  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end

      resources :resumes
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
