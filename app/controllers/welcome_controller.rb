class WelcomeController < ApplicationController
  Rails.applicarion.routes.draw do
    root "welcome#index"
  end

end
