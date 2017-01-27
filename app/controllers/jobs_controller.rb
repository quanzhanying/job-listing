class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.all
  end


  def new
    @job = Job.new
  end

#  def show
#    @job = Job.find(params[:id])
#  end

#  def edit
#    @job = Job.find(params[:id])
#  end

#  def create
#    @job = Job.new(job_params)
#    if @job.save
#      redirect_to jobs_path
#    else
#      render :new
#    end
#  end


end
