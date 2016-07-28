module GroupsHelper
  def render_group_status(group)
    if group.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end
end
