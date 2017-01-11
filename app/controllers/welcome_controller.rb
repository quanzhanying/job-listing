class WelcomeController < ApplicationController
  def index
    flash[:notice] = "加油！！！GJ"
  end
end
