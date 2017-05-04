class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    is_admin
  end
  has_many :resumes
  has_many :jobs
  has_many :shoucang_relationships
  has_many :shoucang_jobs, :through => :shoucang_relationships, :source => :job

  def is_shoucang_of?(job)
    shoucang_jobs.include?(job)
  end

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy
  end

  def display_name
    if self.username.present?
      self.username
    else
      self.email.split("@").first
    end
  end

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :avatar, AttachmentUploader
end
