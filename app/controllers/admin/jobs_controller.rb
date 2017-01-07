class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout "admin"

  # 首页
  def index
    @jobs = Job.all.recent
  end

  # private def
  private
    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email)
    end
end
