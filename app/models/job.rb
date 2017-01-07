#class Job < ApplicationRecord
class Job < ActiveRecord::Base
  validates :title, presence: true
end
