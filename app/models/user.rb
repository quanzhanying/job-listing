class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :resumes
  # has_many :jobs

  def is_admin?
    is_admin
  end
end
