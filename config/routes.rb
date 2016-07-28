Rails.application.routes.draw do
  devise_for :users

   resources :jobs
   root 'jobs#index'

   namespace :admin do
     resources :jobs do
      post :publish
      post :hide
    end
  end
end
