class Group < ActiveRecord::Base
  belongs_to :admin
 validates :title, presence: true
end
