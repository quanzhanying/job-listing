Rails.application.routes.draw do
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :resumes, only: [:index, :new, :create, :destroy]
  end

  namespace :admin do
    resources :jobs
  end
  root "jobs#index"
end
