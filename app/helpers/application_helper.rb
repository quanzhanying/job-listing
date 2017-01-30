module ApplicationHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning" }.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
  end
end
