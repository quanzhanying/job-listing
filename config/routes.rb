Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    member do
      post :join
      post :quit
      get :chaxun
      post :guanzhu
      post :quguan
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
    resources :jobs do
      member do
        get :dianzan
        get :fabu
      end
    end
    resources :resumes

  end
  root "welcome#index"
end
