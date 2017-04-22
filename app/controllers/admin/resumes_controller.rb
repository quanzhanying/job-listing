class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @task = Task.find(params[:task_id])
    @resume = Resume.new
  end

  def create
    @task = Task.find(params[:task_id])
    @resume = Resume.new(resume_params)
    @resume.task = @task
    @resume.user = current_user

    if @resume.save
      flash[:notice] = "成功提交履历"
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
