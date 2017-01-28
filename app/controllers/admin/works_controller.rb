class Admin::WorksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :create, :edit, :destroy]
  before_action :require_is_admin

  def show
    @work = Work.find(params[:id])
  end

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to admin_works_path
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
      redirect_to admin_works_path
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to admin_works_path
  end


  private

  def work_params
    params.require(:work).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

end
