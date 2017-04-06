class WelcomeController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  def index
    flash[:notice] = "hello!"

  end
end
