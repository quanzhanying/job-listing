Rails.application.routes.draw do
  devise_for :users, controllers: {sessions:'users/sessions'}

  resources :jobs do
    member do
      post :join
      post :quit
    end
    collection do
      get :steel
      get :wood
      get :stone
      get :search
      get :perjobs
      get :perresumes
    end
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end
  end

  namespace :account do
    resources :posts
  end


  get "about/index"

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
