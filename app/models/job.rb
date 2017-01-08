class Job < ActiveRecord::Base
 validates :title, presence: true
end
