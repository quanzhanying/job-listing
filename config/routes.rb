Rails.application.routes.draw do
   resources :jobs

 namespace :admin do
   resources :jobs
 end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
end
