class Group < ActiveRecord::Base
  belongs_to :admin
 validates :title, presence: true
 validates :up, presence: true
 validates :down, presence: true
 validates :down, numericality: { greater_than: 0}
 
end
