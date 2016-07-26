class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job=Job.new
  end

  def create
    @group = Job.new(job_params)
    @group.save
    redirect_to jobs_path
  end

  def edit


  end

private

def job_params
  params.require(:job).permit(:title,:description)
end

end
