Rails.application.routes.draw do
  devise_for :users

  resources :jobs do

    resources :resumes

  end

  namespace :applicant do

    resources :resumes

  end

  namespace :admin do

    resources :resumes

  	resources :jobs do

  		member do
  			post :publish
  			post :hide
  		end
  		
  	end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
end
