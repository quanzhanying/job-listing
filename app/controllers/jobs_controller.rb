class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order("wage_lower_bound DESC").paginate(page: params[:page], per_page: 10)
            when 'by_upper_bound'
              Job.published.order("wage_upper_bound DESC").paginate(page: params[:page], per_page: 10)
            else
              Job.published.recent.paginate(page: params[:page], per_page: 10)
            end
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path, notice: "Job successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "Job deleted."
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
