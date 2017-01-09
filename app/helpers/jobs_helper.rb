module JobsHelper
  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
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
