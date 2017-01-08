module Admin::JobsHelper
  def render_job_status(job)
    if job.hidden
      'fa fa-lock'
    else
      "fa fa-globe"
    end
  end
end
