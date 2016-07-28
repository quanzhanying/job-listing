class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def index
    @job = Job.all
  end

  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to job_path
  end
end
