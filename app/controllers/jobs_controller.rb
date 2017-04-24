class JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def show
    @job = Job.find(params[:id])
    if @job.is_hidden
      flash[:warning] = 'This Job already archieved'
      redirect_to root_path
    end
  end

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              #  Job.published.order('wage_lower_bound DESC')
              Job.published.order('wage_lower_bound DESC').search(params[:search]).paginate(page: params[:page], per_page: 5)
            when 'by_upper_bound'
              #  Job.published.order('wage_upper_bound DESC')
              Job.published.order('wage_upper_bound DESC').search(params[:search]).paginate(page: params[:page], per_page: 5)
            else
              Job.published.recent.search(params[:search]).paginate(page: params[:page], per_page: 5)
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

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
