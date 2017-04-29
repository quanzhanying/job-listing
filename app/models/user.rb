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
end
