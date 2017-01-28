module WorksHelper

  def render_work_status(w)
    if w.is_hidden
      content_tag(:span, "", class: "fa fa-lock")
    else
      content_tag(:span, "", class: "fa fa-globe")
    end
  end
end
