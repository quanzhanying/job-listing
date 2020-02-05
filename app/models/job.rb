class Job < ApplicationRecord
  validates :title,presence: true
  validates :salary_max,presence: true
  validates :salary_min,presence: true
  validates :salary_min,numericality:{greater_than:0}
  

  def setHide!
    #self指当前的job对象！！！！
    self.is_hide=true
    self.save
  end

  def setOpen!
    self.is_hide=false
    self.save
  end


end
