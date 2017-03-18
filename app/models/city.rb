class City < ApplicationRecord
  has_and_belongs_to_many :jobs, dependent: :destroy
end
