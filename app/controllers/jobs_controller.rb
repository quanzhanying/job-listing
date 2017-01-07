class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
      @jobs = Job.where(:hidden => false).recent
    end

    def show
      @job = Job.find(params[:id])
    end
    def new
      @job = Job.new
    end
    def create
      @job = Job.new(job_params)
      @job.user = current_user
      if @job.save
        current_user.release!(@job)
        redirect_to jobs_path
      else
        render :new
      end
    end

    def edit
      @job = Job.find(params[:id])
    end

    def update
      @job = Job.find(params[:id])
      if @job.update(job_params)
        redirect_to jobs_path
      else
        render :edit
      end
    end

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to jobs_path
    end

    private
    def job_params
      params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :hidden)
    end
end
