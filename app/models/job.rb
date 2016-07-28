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
#  contact_email    :sting
#  is_hidden        :boolean          default(TRUE)
#

class Job < ApplicationRecord


  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden =true
    self.save
  end

  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
end
