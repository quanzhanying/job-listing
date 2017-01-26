module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "(Hidden)", :class => "fa fa-rocket")
    else
      content_tag(:span, "(Public)", :class => "fa fa-envira")
    end
  end
end
