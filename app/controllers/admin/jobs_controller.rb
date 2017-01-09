class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_filter :require_is_admin

   def index
     @jobs=Job.all
   end

   def show
     @job=Job.find(params[:id])
   end

   def edit
     @job=Job.find(params[:id])
   end


   def new
     @job=Job.new
   end

   def create
     @job=Job.new(job_params)
     @job.user=current_user

     if @job.save
       redirect_to admin_jobs_path
     else
       render :new
     end
   end

   def update
     @job=Job.find(params[:id])
     if @job.update(job_params)
       redirect_to admin_jobs_path, notice: "Update Success"
     else
       render :edit
     end
   end

   def destroy

     @job.destroy
     flash[:alert]="Job deleted"
     redirect_to admin_jobs_path
   end



 private

 def job_params
   params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email, :is_hidden)
 end

end
