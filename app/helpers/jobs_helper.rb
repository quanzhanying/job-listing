module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", style: "color:red", class: "fa fa-lock fa-1")
    else
      content_tag(:span, "", style: "color:green", class: "fa fa-globe fa-1")
    end
  end
end
