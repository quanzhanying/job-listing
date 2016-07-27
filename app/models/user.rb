class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :companies
  has_many :created_jobs, :through => :companies, :source => :job

  def admin?
    is_admin
  end

  def join!(job)
    created_jobs << job
  end
end
