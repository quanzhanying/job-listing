class Job < ApplicationRecord
  validates :title,presence: true
  validates :salary_max,presence: true
  validates :salary_min,presence: true
  validates :salary_min,numericality:{greater_than:0}
  
  # 这种选择组件，能自动根据勾选情况改变数据库中对应字段的值！！！！！和自定义的按钮还不一样，要在model中定义方法、在controller中定义action
  # def setHide
  #   is_hide=true
  # end
  #
  # def setShow
  #   is_hide=false
  # end
  #
  # def hide?
  #   is_hide
  # end
  
end
