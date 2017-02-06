class Account::FavorController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = current_user.favor_jobs
  end
end
