module Admin::JobsHelper
  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-eye-slash")
    else
      content_tag(:span, "", :class => "fa fa-eye")
    end
  end
end
