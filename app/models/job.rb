class Job < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :user
  has_many :companies
  has_many :members, through: :companies, source: :user
end
