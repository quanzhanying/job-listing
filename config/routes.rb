Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :movies do
      member do
        post :publish
        post :hide
      end
    end
  end
  resources :movies
  root 'movies#index'

end
