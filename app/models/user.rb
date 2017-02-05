class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :applied_jobs, :through => :resumes, :source => :job

  has_many :favor_job_relationships
  has_many :favor_jobs, through: :favor_job_relationships, source: :job

  def admin?
    is_admin
  end

  def has_applied_for?(job)
    applied_jobs.include?(job)
  end

  def has_follow?(job)
    favor_jobs.include?(job)
  end

  def follow!(job)
    favor_jobs << job
  end

  def unfollow!(job)
    favor_jobs.delete(job)
  end
end
