module JobsHelper

  def render_job_status(job)
    if job.is_hidden
       content_tag(:span, "", :class => "fa fa-music")
    else
      content_tag(:span, "", :class => "fa fa-headphones")
    end
  end
  def render_highlight_content(job,query_string)
    excerpt_cont = excerpt(job.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

end
