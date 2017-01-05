class WelcomeController < ApplicationController
  def index
    flash[:notice] = "相信我，这个世界不能没有你！"
  end
end
