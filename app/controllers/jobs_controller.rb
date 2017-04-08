class JobsController < ApplicationController

  def index
    flash[:notice] = "欢迎来到全栈营！"
    flash[:warning] = "欢迎来到全栈营！"
    flash[:alert] = "欢迎来到全栈营！"
  end

  def new
    @job = Job.new
  end

  
end
