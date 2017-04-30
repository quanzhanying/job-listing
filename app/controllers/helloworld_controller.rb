class HelloworldController < ApplicationController

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page])
  end

end
