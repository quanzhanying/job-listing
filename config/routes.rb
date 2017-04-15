Rails.application.routes.draw do
  devise_for :users
  #root 'welcome#index'

  root 'jobs#index'

  resources :jobs

  namespace :admin do
    resources :jobs
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
