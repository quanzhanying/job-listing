module FlashesHelper
  FLASS_CLASS = { alert: "danger", notice: "success", warning: "warning"}

  def flash_class(key)
    FLASS_CLASS.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
end
