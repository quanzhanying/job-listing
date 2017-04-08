Rails.application.routes.draw do
  resources :jobs
  root 'welcome#index'
end
