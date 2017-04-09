class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hi, welcome to joblisting"
  end
end
