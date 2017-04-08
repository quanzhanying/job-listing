Rails.application.routes.draw do
  resources :jobs
  root 'jobs#index'
end
