class Job < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You are not admin"
      redirect_to root_path
    end
  end
end
