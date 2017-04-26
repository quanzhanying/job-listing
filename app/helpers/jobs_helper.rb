module JobsHelper

  def render_job_status(job)
    if job.is_hidden
       content_tag(:span, "", :class => "fa fa-music")
    else
      content_tag(:span, "", :class => "fa fa-headphones")
    end
  end
end
