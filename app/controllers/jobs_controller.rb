class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def index
    @job = Job.all
  end
end
