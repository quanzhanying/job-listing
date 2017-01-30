Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works do
    resources :jianlis
  end

  namespace :admin do
    resources :works do
    member do
      post :publish
      post :hide
     end
    resources :jianlis
    end
  end
  root 'works#index'
end
