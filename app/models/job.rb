class Job < ApplicationRecord

  validates :title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, presence: {message: "This option must be given!"}
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates :contact_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "%{value} is not a valid email!"} 

end
