class Admin::JianlisController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @work = Work.find(params[:work_id])
    @jianlis = @work.jianlis.order('created_at DESC')
  end
end
