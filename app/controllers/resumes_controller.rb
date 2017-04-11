class ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_job_by_id, only: [:new, :edit, :create, :update, :destroy]
  before_action :find_resume_by_id, only: [:edit, :update, :destroy]

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user

    if @resume.save
      redirect_to jobs_path(@job), notice: "Resume hes been uploaded."
    else
      render :new
    end
  end

  def update
    if @resume.update(resume_params)
      redirect_to admin_job_path(@job), notice: "Resume successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to admin_job_path(@job), alert: "Resume has been deleted."
  end

  private

  def find_job_by_id
    @job = Job.find(params[:job_id])
  end

  def find_resume_by_id
    @resume = Resume.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
