module JobsHelper

  def render_job_title(job)
    simple_format(job.title)
  end

  def render_job_description(job)
    simple_format(job.description)
  end

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span,"", :class => "fa fa-lock")
    else
      content_tag(:span,"", :class => "fa fa-unlock")
    end
  end
end
