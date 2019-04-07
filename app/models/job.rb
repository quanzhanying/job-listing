class Job < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :wage_upper_bound, presence: true, numericality: {greater_than: :wage_lower_bound}
  validates :wage_lower_bound, presence: true, numericality: {greater_than: 0}
  validates_format_of :contact_email,:with => Devise::email_regexp
  
  scope :recent, -> { order("created_at DESC")}
  scope :published, -> { where(is_hidden: false) }
  
end
