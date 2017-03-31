class ApplicationController < ActionController::Base
  def index
    flash[:notice] = "早安！你好！"
  end
end
