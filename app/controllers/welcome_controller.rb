class WelcomeController < ApplicationController
  def index
    flash[:notice]="Morning! Hello!"
  end
end
