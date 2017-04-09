module JobsHelper

  def render_job_state(job)
    if !job.hide
      '<i class="fa fa-globe" aria-hidden="true"></i>'.html_safe
     else
       '<i class="fa fa-lock" aria-hidden="true"></i>'.html_safe
     end
  end

  def render_publish_button_state(job)
     if job.hide
       '<%= link_to("Publish",job_publish_path(job), method: :post, class: "btn btn-primary")'.html_safe
     else
       '<%= link_to("Hide", job_hide_path(job), method: :post, class: "btn btn-primary") %>'.html_safe
     end
  end

end
