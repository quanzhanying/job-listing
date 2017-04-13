class Admin::JobsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def job_params
    params.require(:job).permit(:title, :description)
  end
end
