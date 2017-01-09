Rails.application.routes.draw do

  devise_for :users
  resources :jobs
  namespace :admin do
      resources :jobs do
        member do
          post :hidden
          post :public
        end
      end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
end
