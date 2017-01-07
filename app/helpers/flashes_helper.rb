module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning"}

  def falsh_class(key)
    FLASHES_CLASS.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
end
