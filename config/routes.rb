Rails.application.routes.draw do
  resources :welcome do

 end
   devise_for :users
  root 'welcome#index'


   namespace :admin do
   resources :jobs do
      member do
       post :publish
       post :hide
   end
  end
 end



   resources :jobs do
   resources :resumes

   end
 end
