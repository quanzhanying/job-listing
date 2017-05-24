class JobsController < ApplicationController


  def index

    @q = Job.ransack(params[:q])

      @jobs = case params[:order]
        when 'by_min_salary'
          #  Job.all.order(salaryMin: :DESC).paginate(page: params[:page])
          @jobs = @q.result(distinct: true).order(salaryMin: :DESC).page(params[:page])

        when 'by_max_salary'
          #  Job.where(hide:false).order(salaryMax: :DESC).paginate(page: params[:page])
          @jobs = @q.result(distinct: true).order(salaryMax: :DESC).page(params[:page])
        else
          # Job.where(hide:false).order(created_at: :DESC).paginate(page: params[:page])
          @jobs = @q.result(distinct: true).order(created_at: :DESC).page(params[:page])
      end
  end

  def show
    # render plain: params.inspect
    @job = Job.find(params[:id])
    if @job.hide
      redirect_to jobs_path
    end
  end

  def new
    flash[:warning] = "You can create job!"
    redirect_to jobs_path
  end

  def create
    flash[:warning] = "You can create job!"
    redirect_to jobs_path
  end

  def edit
    flash[:warning] = "You can edit job!"
    redirect_to jobs_path
  end

  def destroy
    flash[:warning] = "You can delete job!"
    redirect_to jobs_path
  end

  def search
    
  end

end
