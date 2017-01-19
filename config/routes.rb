Rails.application.routes.draw do
namespace :admin do
  resources :jobs
end

  devise_for :users
  resources :jobs
root 'jobs#index'
end
