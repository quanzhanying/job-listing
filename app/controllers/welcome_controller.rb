class WelcomeController < ApplicationController
  def index
    flash[:warning] = "5月份之前咱要把网站做出来啊"
  end
end
