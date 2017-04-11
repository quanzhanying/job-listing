class ResumesController < ApplicationController
  before_action :authenticate_user!, only:[:index, :index, :create, :destory]

  def index
    @resumes = Resume.where(:user_id => current_user.id).order("created_at DESC")
  end

  def new
    @resume = Resume.new
    @job = Job.find(params[:job_id])
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user = current_user;
    @resume.job = Job.find(params[:job_id])
    if @resume.save
      flash[:notice] = "Upload resume success."
      redirect_to job_resumes_path
    else
      flash[:warning] = "Failed to upload resume."
      render :new
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    if @resume.user.id == current_user.id
      if @resume.delete
        flash[:notice] = "remove resume success."
        redirect_to job_resumes_path
      else
        flash[:warning] = "failed to remove resume."
        redirect_to job_resumes_path
      end
    else
      flash[:warning] = "You cant remove the resume."
      redirect_to job_resumes_path
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :attatchment, :job_id)
  end
end
