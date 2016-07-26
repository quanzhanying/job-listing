class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :contact_email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :contact_email, presence: true

end
