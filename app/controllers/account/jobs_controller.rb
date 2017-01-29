class Account::JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @resumes = Resume.select('resumes.content, resumes.created_at, jobs.title').joins(:job)
                .where(user_id: current_user.id)
  end

end
