class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  has_many :applied_jobs, :through => :resumes, :source => :job

  def admin?
    is_admin
  end

  def has_applied_for?(job)
    applied_jobs.include?(job)
  end

end
