class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end
end
