class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_many :job_relationships
  has_many :released_jobs, through: :job_relationships, source: :job

  def release!(job)
    released_jobs << job
  end
end
