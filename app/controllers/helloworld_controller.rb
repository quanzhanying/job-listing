class HelloworldController < ApplicationController

  def index
    flash[:notice] = "Moring!"
  end


end
