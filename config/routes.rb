Rails.application.routes.draw do
   resources :jobs
  devise_for :users
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
