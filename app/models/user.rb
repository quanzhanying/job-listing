class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :resumes

#  这里的 def 函数是用来判断在是否为admin（管理员）的，同时写这个函数，
# 而不是直接在函数中写 current_user.is_admin我猜测是为代码简介性考虑的。
  def admin?
  	is_admin
  end
end
