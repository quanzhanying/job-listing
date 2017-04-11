Rails.application.routes.draw do
  devise_for :users

   resources  :jobs do
     resources :resumes
   end



  # namespace :admin do
  #   resources :jobs
  # end
  #
  # namespace :account do
  #   resources :jobs
  # end

  namespace :admin do
    resources :jobs do
      post :hide
      post :publish
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'jobs#index'
end
