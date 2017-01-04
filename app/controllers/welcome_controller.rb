class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Hello, Mr. first week"
  end
end
