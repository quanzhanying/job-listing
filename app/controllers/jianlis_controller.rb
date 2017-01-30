class JianlisController < ApplicationController
  before_action :authenticate_user!

  def new
    @work = Work.find(params[:work_id])
    @jianli = Jianli.new
  end


  def create
    @work = Work.find(params[:work_id])
    @jianli = Jianli.new(jianli_params)
    @jianli.work = @work
    @jianli.user = current_user

    if @jianli.save
      flash[:warning] = "submit succeed"
      redirect_to work_path(@work)
    else
      render :new
    end
  end

private
  def jianli_params
    params.require(:jianli).permit(:content, :attachment)
  end
end
