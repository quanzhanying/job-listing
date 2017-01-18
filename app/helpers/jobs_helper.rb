module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      "(Hidden)"
    else
      "(Publish)"
    end

  end
end
