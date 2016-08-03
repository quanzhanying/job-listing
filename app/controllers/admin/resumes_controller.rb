class Admin::ResumesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin

  layout 'admin'

  def index
    @group = Group.find(params[:group_id])
    @resumes = @group.resumes.order('created_at DESC')
  end
end



  
