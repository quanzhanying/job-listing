class WelcomeController < ApplicationController
  def index
    flash[:notice] = "心在哪里，位置就在哪里！"
  end
end
