class WelcomeController < ApplicationController
  def index
    flash[:notice] = 'Good morning！Antarts！'
   end
end
