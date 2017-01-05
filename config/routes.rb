Rails.application.routes.draw do
  devise_for :admins
   resources :groups
   root 'groups#index'
end
