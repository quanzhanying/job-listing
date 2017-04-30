class Account::JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users=current_user.followed_users
  end
  def show
    @user=User.find(params[:id])
    @jobs=@user.jobs.where(:is_hidden => false).recent
  end

  def fabu
    @jobs=current_user.jobs.recent
  end
  def dianzan
    @jobs=current_user.shoucang_jobs.where(:is_hidden => false).recent
  end

end
