# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Job < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user
end
