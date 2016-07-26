module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end

  def render_job_status(job)
    if job.is_hidden
      "( Private )"
    else
      "( Public )"
    end
  end
end
