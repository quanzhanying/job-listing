module JobsHelper
  def render_job_status(j)
    if j.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
