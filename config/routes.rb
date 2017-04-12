Rails.application.routes.draw do
  devise_for :users
  root 'jobs#index'
end
