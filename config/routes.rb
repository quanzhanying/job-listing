Rails.application.routes.draw do
  devise_for :users

  resources :welcome do

    end
root 'welcome#index'


  resources :jobs do
    resources :resumes
  end

  get 'about' => 'about#index'


  namespace :admin do
    resources :jobs do
    member do
      post :publish
      post :hide
    end
   resources :resumes
  end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
