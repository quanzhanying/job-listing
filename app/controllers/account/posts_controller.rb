class Account::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @post_jobs = current_user.post_jobs
    @collect_jobs = current_user.participated_jobs
  end



end
