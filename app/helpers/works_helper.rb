module WorksHelper

  def render_work_status(w)
    if w.is_hidden
      "(隐藏)"
    else
      "(公开)"
    end
  end
end
