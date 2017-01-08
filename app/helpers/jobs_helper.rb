module JobsHelper
  def render_job_status(job)
     if job.is_hiden
       "(Hidden)"
     else
       "(Public)"
     end     
  end
end
