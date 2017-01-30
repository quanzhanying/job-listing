Rails.application.routes.draw do
  devise_for :users

namespace :admin do
  resources :jobs do
    member do
      post :public
      post :hide
    end
    resources :resumes
  end
end
  resources :jobs do
    resources :resumes
  end

  root 'welcome#index'# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
