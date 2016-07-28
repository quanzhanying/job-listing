Rails.application.routes.draw do
  devise_for :users

  resources :jobs do
    get :index_upper_bound
  end
  namespace :admin do
    resources :jobs do
      member do
        post :change_hidden
      end
    end
  end
  root "jobs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
