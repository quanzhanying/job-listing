Rails.application.routes.draw do
   resources :groups
   root 'groups#index'
end
