class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :upate, :destory,:publish, :hide]
  before_action :require_is_admin
  layout  "admin"
  def index
    @jobs = Job.where(user_id: current_user.id).order("created_at DESC")
    isUserDashBoard = params[:isUserDashBoard]
    if !isUserDashBoard.blank? && isUserDashBoard
        @isUserDashBoard = true
    end
  end

  def new
    @job = Job.new
  end

  def create
    #
    # render plain: params.inspect
    # return

    @job = Job.new(job_params)
    # if @job.salaryMin.to_i <= 0
    #   flash[:warning] = "Salary can't less than 0."
    #   render :new
    #   return
    # elsif @job.salaryMax.to_i < @job.salaryMin.to_i
    #   flash[:warning] = "Salary Max must be greater than Salary Min"
    #   render :new
    #   return
    # end

    @job.user = current_user
    @job.save
    # if @job.save
    #   flash[:notice] = "Create job successful."
    #   redirect_to root_path
    # else
    #   flash[:alert] = "Failed to create job."
    #   redirect_to new_job_path()
    # end
    redirect_to admin_jobs_path
  end

  def edit
    @job = Job.find(params[:id])
    if @job.blank?
      flash[:alert] = "Job don't exist"
      redirect_to admin_jobs_path
    end
  end

  def update

    @job = Job.find(params[:id])
    if !@job.blank?
      maxSalary =  job_params[:salaryMax].to_i
      minSalary = job_params[:salaryMin].to_i
      if   minSalary <= 0
        flash[:warning] = "Salary can't less than 0."
        redirect_to edit_admin_job_path(@job)
        return
      elsif minSalary > maxSalary
        flash[:warning] = "Salary Max must be greater than Salary Min"
        render :new
        return
      end
       if @job.update(job_params)
         flash[:notice] = "Update Job successful."
         redirect_to admin_jobs_path
       else
         flash[:error] = "Failed to update job."
          redirect_to admin_jobs_path
       end
    else
    end
  end

  def show

    @job = Job.find(params[:id])
    if @job.hide
      redirect_to admin_jobs_path
    end
  end


  def destroy
    @job = Job.find(params[:id])
    if @job.blank?

      flash[:warning] = "Failed to remove job, can't find job."
      redirect_to admin_jobs_path
    else
      @job.delete
      flash[:notice] = "Delete job successful."
      redirect_to admin_jobs_path
    end

  end

  def publish
    if current_user && current_user.isAdmin
      show_job(true)
    else
      flash[:warning] = "You dont have right to do this action"
      redirect_to admin_jobs_path
    end
  end

  def hide
    if current_user && current_user.isAdmin
      show_job(false)
    else
      flash[:warning] = "You dont have right to do this action"
      redirect_to jobs_path
    end

  end



  private


  def show_job(bshow)
    @job = Job.find(params[:job_id])
    @job.hide = !bshow
    if @job.save
      flash[:notice] = "Publish job successful."
    else
      flash[:warning] = "Failed to save job."
    end
    redirect_to admin_jobs_path
  end

  def job_params
    params.require(:job).permit( :title, :description, :salaryMax, :salaryMin, :contact, :hide)
  end


end
