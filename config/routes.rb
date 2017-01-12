Rails.application.routes.draw do
  devise_for :users

resources :jobs do
    resources :resumes
  end


   root 'jobs#index'
namespace :admin do
    resources :jobs do
       member do
        post :publish
        post :hide
      end
      resources :resumes
      end
   end
end
