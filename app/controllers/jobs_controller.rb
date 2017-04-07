class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :update, :edit, :destroy]
  before_action :find_job, only: [:edit, :update, :destroy, :show]
  before_action :require_is_admin, only: [:create, :update]
  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

=begin
  def new
    @job = Job.new
  end



  def show

  end

  def destroy
    @job.destroy
    flash[:alert] = "Job deleted!"
    redirect_to jobs_path

  end



  def edit

  end
=end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end


  def update
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Update Success"
    else
      render :edit
    end
  end



  private

  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
  end


end
