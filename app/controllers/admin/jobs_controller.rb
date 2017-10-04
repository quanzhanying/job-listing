class Admin::JobsController < ApplicationController

  before_action :get_job_id, :only =>[:show, :edit, :destroy, :update]
  before_filter :authenticate_user!
  before_filter :require_is_admin
  def index
    @jobs = current_user.jobs.order("created_at DESC")
  end

  def require_is_admin
    unless current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :salary_max, :salary_min, :is_hidden)
  end

  def get_job_id
    @job = Job.find(params[:id])
  end
end
