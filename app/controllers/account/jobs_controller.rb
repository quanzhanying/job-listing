class Account::JobsController < ApplicationController

  def index
    @users=current_user.followed_users
  end
  def show
    @user=User.find(params[:id])
    @jobs=@user.jobs.where(:is_hidden => false)
  end

  def fabu
    @jobs=current_user.jobs
  end
  def dianzan
    @jobs=current_user.shoucang_jobs.where(:is_hidden => false)
  end

end
