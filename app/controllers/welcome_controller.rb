class WelcomeController < ApplicationController
  def indxe
    flash[:notice] = "早安！你好！"
  end
end
