Rails.application.routes.draw do
  devise_for :users

   resources :jobs
   root 'jobs#index'

   resources :job do
     resources :resumes
   end

   namespace :admin do
     resources :jobs do
       member do
         post :publish
         post :hide
       end
     end
   end

end
