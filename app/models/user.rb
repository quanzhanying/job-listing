class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  def admin?
#      is_admin
#  end
#  因为rails c 有bug 暂时跳过这一步 "Step 6: 把 admin? 的条件改为由资料库判断"
  def admin?
    email == 'lilei@sina.com'
  end

  has_many :resumes
end
