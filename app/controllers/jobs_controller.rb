class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:index]
  def index
    @jobs = Job.all
    flash[:notice] = "早安！你好！"
  end
end
