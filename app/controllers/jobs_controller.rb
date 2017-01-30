class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

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

  def update
     @job = Job.find(params[:id])
     @job.update(job_params)
     redirect_to jobs_path, notice: '职位修改成功！'
#   if @job.update(job_params)
#       redirect_to jobs_path, notice: '职位修改成功'
#   else
#       render :edit
#   end
#  the same expression
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

#  def destroy
#    @job = Job.find(params[:id])
#    @job.destroy
#    flash[:alert] = "职位成功删除"
#    redirect_to jobs_path
#  end



  private

  def job_params
   params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email,:is_hidden)
  end

end
