class Resume < ApplicationRecord
  belongs_to :user
  belongsjob :job
end
