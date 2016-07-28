module GroupsHelper
  def render_group_status(group)
    if group.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
