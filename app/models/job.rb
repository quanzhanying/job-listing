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
#

class Job < ApplicationRecord
  validates :title, presence: true
  scope :published, -> {where(is_hidden: false)}
  scope :recent, -> {order('created_at DESC')}

  def publish!
    self.is_hidden = false
    self.save

  end

  def hide!
    self.is_hidden =true
    self.save
  end
end
