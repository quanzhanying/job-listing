class WelcomeController < ApplicationController
  def index
   flash[:notice] = "Be Patient!"
  end
end
