module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end

  def job_status(job)
    if job.is_hidden
      "(🕶隐藏)"
    else
      "(👓可见)"
    end
  end
end
