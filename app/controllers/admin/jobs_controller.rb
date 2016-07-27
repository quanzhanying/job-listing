class Admin::JobsController <ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params_jobs)
    @job.save
    redirect_to admin_jobs_path
  end

  def edit
    @job = Job.find(params[:id])

  end

  def show
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)

    redirect_to admin_jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to admin_jobs_path

  end


end

private

  def params_jobs
    params.require(:job).permit(:title, :description)

  end
