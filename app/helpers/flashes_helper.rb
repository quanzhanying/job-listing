module FlashHelper
  FLASH_CALSSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    falsh.to_hash.slice "alert", "notice", "warning"
  end
end
