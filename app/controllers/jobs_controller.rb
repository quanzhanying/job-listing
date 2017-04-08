class JobsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :upate, :destory]
  before_action :isAdmin
  def index
    if !params[:admin_id].blank?
      if current_user.isAdmin
        @jobs = Job.where(user_id: current_user.id).order("created_at DESC")
      else
        redirect_to jobs_path
      end
    else
      @jobs = Job.all.order("created_at DESC")
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
    if @job.salaryMin.to_i <= 0
      flash[:warning] = "Salary can't less than 0."
      render :new
      return
    elsif @job.salaryMax.to_i < @job.salaryMin.to_i
      flash[:warning] = "Salary Max must be greater than Salary Min"
      render :new
      return
    end

    @job.user = current_user
    if @job.save
      flash[:notice] = "Create job successful."
      redirect_to root_path
    else
      flash[:error] = "Failed to create job."
      redirect_to root_path
    end
  end

  def edit
    @job = Job.find(params[:id])
    if @job.blank?
      flash[:error] = "Job don't exist"
      redirect_to jobs_path
    end
  end

  def update

    @job = Job.find(params[:id])
    if !@job.blank?
      maxSalary =  job_params[:salaryMax].to_i
      minSalary = job_params[:salaryMin].to_i
      if   minSalary <= 0
        flash[:warning] = "Salary can't less than 0."
        redirect_to edit_job_path(@job)
        return
      elsif minSalary > maxSalary
        flash[:warning] = "Salary Max must be greater than Salary Min"
        render :new
        return
      end
       if @job.update(job_params)
         flash[:notice] = "Update Job successful."
         redirect_to jobs_path
       else
         flash[:error] = "Failed to update job."
          redirect_to jobs_path
       end
    else
    end
  end

  def show
    render plain: params.inspect

    # @job = Job.find(params[:id])
  end


  def destroy
    @job = Job.find(params[:id])
    if @job.blank?

      flash[:warning] = "Failed to remove job, can't find job."
      redirect_to jobs_path
    else
      @job.delete
      flash[:notice] = "Delete job successful."
      redirect_to jobs_path
    end

  end

  private


  def job_params
    params.require(:job).permit( :title, :description, :salaryMax, :salaryMin, :contact, :hide)
  end

  def isAdmin
  end


end
