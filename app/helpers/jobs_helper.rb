module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end

  # 暂时不用
  def job_status(job)
    if job.is_hidden
      "(🕶隐藏)"
    else
      "(👓可见)"
    end
  end

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-eye-slash")
    else
      content_tag(:span, "", :class => "fa fa-eye")
    end
  end
end
