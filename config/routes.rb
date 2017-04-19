Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :jobs do
    member do
      resources :resumes
    end
  end



  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end

  root 'jobs#index'
end
