Rails.application.routes.draw do
  devise_for :users,controllers:{sessions:'users/sessions'}

   namespace :admin do
   resources :jobs  do
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

   namespace :shuguo do
  resources :jobs
end

 root 'welcome#index'

 resources :jobs do
   collection do
     get :search
   end
   end
 end
