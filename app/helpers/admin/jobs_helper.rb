module Admin::JobsHelper
  def render_job_status(job)
		if job.is_hide
      #fontwsome图标：
		  content_tag(:span,"", :class => "fa fa-lock")
		else
		  content_tag(:span,"", :class => "fa fa-unlock")
		end 
  end
end
