module Admin::JobsHelper
  def render_job_status(job)
    if job.hidden
      'fa fa-lock'
    else
      "fa fa-globe"
    end
  end
  def render_job_status_button(job)
    if job.hidden
      link_to('Publish',publish_admin_job_path(job), method: :post, :class => "btn btn-sm btn-default")
    else
      link_to('Hide',hide_admin_job_path(job), method: :post, class: "btn btn-sm btn-default")
    end
  end
end
