class JobsController < ApplicationController

  def show
    @jobs = Jon.find(params[:id])
  end
end
