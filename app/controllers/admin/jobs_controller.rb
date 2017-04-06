class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy, :index]
  before_action :require_is_admin

  def index
    @jobs = Job.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params1)
      redirect_to admin_jobs_path, notice: "Update Success!"
    else
      render :edit
    end
  end

  private

  def job_params1
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end


end
