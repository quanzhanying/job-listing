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
      collection do
        get :search
      end
    end
  
  root 'welcome#index'

  get 'introduction' => 'jobs#introduction'
  get 'business' => 'jobs#business'
  get 'professional' => 'jobs#professional'
  get 'quality' => 'jobs#quality'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
