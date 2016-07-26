module JobsHelper
  def render_job_description(job)
    simple_format(job.description)
  end

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "( Private )", style: "color:red")
    else
      content_tag(:span, "( Private )", style: "color:green")
    end
  end
end
