class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  # def index
  #   @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  # end
  # def index
  #   @jobs = case params[:order]
  #           when 'by_lower_bound'
  #             Job.where(is_hidden: false).order('wage_lower_bound DESC')
  #           when 'by_upper_bound'
  #             Job.where(is_hidden: false).order('wage_upper_bound DESC')
  #           else
  #             Job.where(is_hidden: false).order('created_at DESC')
  #           end
  # end
  # def index
  #   @jobs = case params[:order]
  #           when 'by_lower_bound'
  #             Job.published.order('wage_lower_bound DESC')
  #           when 'by_upper_bound'
  #             Job.published.order('wage_upper_bound DESC')
  #           else
  #             Job.published.order('created_at DESC')
  #           end
  # end
  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.published.order('wage_upper_bound DESC')
            else
              Job.published.recent
            end
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
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
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :email, :is_hidden)
  end

end
