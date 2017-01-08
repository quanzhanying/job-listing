module Admin::JobsHelper
  def render_job_status(job)
    if job.hidden
      return '(Hidden)'
    else
      return '(Pulibc)'
    end
  end
end
