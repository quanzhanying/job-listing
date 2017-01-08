module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      "🔒(Hidden)"
    else
      "🔓(Public)"
    end
  end

def render_job_status2(job)
  if job.is_hidden
    "🌛"
  else
    "🌞"
  end
end



end
