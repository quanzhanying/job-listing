class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  # 首页
  def index
    @jobs = Job.all
  end
end
