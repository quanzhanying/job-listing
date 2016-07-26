class Account::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_user.created_jobs
  end
end
