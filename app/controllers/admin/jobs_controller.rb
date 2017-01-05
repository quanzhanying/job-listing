class Admin::JobsController < ApplicationController
  before_filter :authenticate!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  def require_is_admin
    if !current_user.admin?
      redirect_to root_path, alert: "You are not admin"
    end
  end
end
