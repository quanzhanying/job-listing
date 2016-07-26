class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :jobs


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    # if email == "shaojunda@gmail.com"
    #   return true
    # else
    #   return false
    # end
    is_admin
  end
end
