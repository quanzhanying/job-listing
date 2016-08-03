class ResumesController < ApplicationController
  before_action :authenticate_user!


  def new
    @group = Group.find(params[:group_id])
    @resume = Resume.new
  end

  def create
    @group = Group.find(params[:group_id])
    @resume = Resume.new(resume_params)
    @resume.group = @group
    @resume.user = current_user

    if @resume.save
      flash[:notice] = "Submit Success"
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end

end
