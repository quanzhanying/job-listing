module Admin::JobsHelper
  def render_job_staus(job)
    if job.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end

  end
end
