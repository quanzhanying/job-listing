Rails.application.routes.draw do
  devise_for :user
  root 'welcome#index'
end
