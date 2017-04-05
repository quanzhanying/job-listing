class JobsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update ,:destroy]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def show
  end

private

  def job_params
    params.require(:job).permit(:title,:description)
  end

end
