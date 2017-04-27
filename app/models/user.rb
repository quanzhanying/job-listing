class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_many :resumes


  # ---已投功能---
  has_many :resume_relationship
  has_many :post_jobs, :through => :resume_relationship, :source => :job

  def has_postmen_of?(job)
    post_jobs.include?(job)
  end

  def join_post!(job)
    post_jobs << job
  end

  def quit_post!(job)
    post_jobs.delete(job)
  end


  # ---收藏功能---
  has_many :collects
  has_many :participated_jobs, :through => :collects, :source => :job

  def is_member_of?(job)
    participated_jobs.include?(job)
  end

  def join_collect!(job)
    participated_jobs << job
  end

  def quit_collect!(job)
    participated_jobs.delete(job)
  end

  # ------------

  def admin?
    is_admin
  end


end
