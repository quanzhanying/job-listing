class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def require_is_admin
     if !current_user.admin?
       flash[:alert] = 'You are not admin'
       redirect_to root_path
     end
   end


  def show
    @job = Job.find(params[:id])
  end

  def index
      @jobs = case params[:order]
              when 'by_lower_bound'
                Job.order('wage_lower_bound DESC')
              when 'by_upper_bound'
                Job.order('wage_upper_bound DESC')
              else
                Job.order('created_at DESC')
              end
    end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
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
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to admin_jobs_path
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end



  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end
end
