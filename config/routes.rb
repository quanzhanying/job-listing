Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "jobs#index"
  
  resources :jobs do
    resources :resumes
  end
  
  
  namespace :admin do
    resources :jobs do

      member do
        post 'setHide'
        post 'setOpen'
      end

      resources :resumes  do
        member do
          get 'download'
        end
      end

    end
  end
  
  
  
  
end
