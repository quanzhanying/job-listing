module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end
end
