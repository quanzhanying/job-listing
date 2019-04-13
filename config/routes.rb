Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :jobs do
      member do
        put :toggle_hidden
      end
    end
  end

  resources :jobs do
    resources :resumes
  end

  root 'welcome#index'
end
