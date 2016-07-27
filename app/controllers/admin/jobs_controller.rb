class Admin::JobsController <ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

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

  private

  def params_jobs
    #params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email，:is_hidden)
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end
end
