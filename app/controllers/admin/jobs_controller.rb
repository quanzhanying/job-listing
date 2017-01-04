class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  # 首页
  def index
    @jobs = Job.all
  end
end
