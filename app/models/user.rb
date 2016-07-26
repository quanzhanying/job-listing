class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :companies
  has_many :created_jobs, :through => :companies, :source => :job

  def require_is_admin(job)
    created_jobs.include?(job)

  end
end
