class WelcomeController < ApplicationController
  def index
    flash[:notice] = "早上好，爱生活的人运气总是不会太差"
  end 
end
