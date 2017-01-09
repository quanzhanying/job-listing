class WelcomeController < ApplicationController
  def index
    flash[:noitce]="Hello! How are you?"
  end
end
