module Admin::JobsHelper
  def visible?(job)
    !job.is_hidden ? '(Private)' : '(Public)'
  end
end
