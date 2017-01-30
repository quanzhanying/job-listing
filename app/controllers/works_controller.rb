class WorksController < ApplicationController
  before_action :authenticate_user!,  only: [:new, :create, :update, :edit, :destroy]

  def show
    @work = Work.find(params[:id])

    if @work.is_hidden
      flash[:notice] = "get out"
      redirect_to root_path
    end
  end

  def index
    @works = case params[:order]
             when 'by_lower_bound'
               Work.published.order('wage_lower_bound DESC')
             when 'by_upper_bound'
               Work.published.order('wage_upper_bound DESC')
             else
               Work.published.recent
            end
          end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end


  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    redirect_to works_path
  end
  private

  def work_params
    params.require(:work).permit(:title, :description, :wage_lower_bound,
    :wage_upper_bound, :contact_email, :is_hidden)
  end
end
