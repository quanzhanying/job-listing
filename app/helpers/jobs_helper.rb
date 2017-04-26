module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      "(隐藏)"
    else
      "(显示)"
    end
  end
end
