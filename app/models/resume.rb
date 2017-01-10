class Resume < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :job
end
