class WelcomeController < ApplicationController
  def index
  flash[:notice] = "Superlei！你好！"
  end
end
