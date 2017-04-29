class Account::JobsController < ApplicationController




  def fabu
    @jobs=current_user.jobs
  end
  def dianzan
    @jobs=current_user.shoucang_jobs
  end

end
