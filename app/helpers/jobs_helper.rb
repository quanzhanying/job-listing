module JobsHelper

  def render_job_status(job)
   if job.is_hidden_1
     content_tag(:span,"",:class => "fa fa-lock")
   else
     content_tag(:span,"",:class => "fa fa-globe")
   end
 end

end
