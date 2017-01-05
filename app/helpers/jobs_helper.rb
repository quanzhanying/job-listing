module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      '<i class="fa fa-lock"> </i> '
    else
      '<i class="fa fa-globe"> </i> '
    end
  end
end
