class PostsController < ApplicationController
  def index
    @jobs = Job.all
  end
  def new
    @job = Job.new
  end
  def edit
  end
end
