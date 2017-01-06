class Admin::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end
end
