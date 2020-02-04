module Admin::JobsHelper
  def render_job_status(job)
		if job.is_hide
		  "【隐藏】"
		else
		  "【公开】"
		end 
  end
end
