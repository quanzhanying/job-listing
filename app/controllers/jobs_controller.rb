class JobsController < ApplicationController
  # before_action :authenticate_user!, only: [:index]
  def index
    flash[:warning] = "warning"
  end
end
