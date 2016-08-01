# == Schema Information
#
# Table name: jobs
#
#  id               :integer          not null, primary key
#  title            :string
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  wage_upper_bound :integer
#  wage_lower_bound :integer
#  contact_email    :string
#  is_hidden        :boolean          default(TRUE)
#

class Job < ApplicationRecord
  has_many :resumes
  belongs_to :user
  scope :published, -> { where(is_hidden: false)}
  scope :recent, -> { order("created_at") }
  validates :title, presence: true

  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}

  def publish!
    if is_hidden
      self.is_hidden = false
      self.save
    end
  end

  def hide!
    if !is_hidden
      self.is_hidden = true
      self.save
    end
  end
end
