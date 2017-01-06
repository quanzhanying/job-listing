module JobsHelper

  def render_job_status(job)
   if job.is_hidden_1
     "(Hidden)"
   else
     "(Public)"
   end
 end

end
