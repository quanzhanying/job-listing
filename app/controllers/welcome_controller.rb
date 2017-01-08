class WelcomeController < ApplicationController

  def index
    flash[:notice] = 'nihao'
  end
end
