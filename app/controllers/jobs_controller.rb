class JobsController < ApplicationController
  before_action :user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.all
  end
end
