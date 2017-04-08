module JobsHelper

  def render_job_description(job)
      simple_format(job.description)
  end

  def render_job_status(job)
    job.is_hidden ? "(Hidden)" : "(Public)"
  end
end
