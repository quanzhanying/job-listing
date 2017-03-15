class WelcomeController < ApplicationController
  def index
    flash[:notice] = "但行好事，莫问前程。"
  end
end
