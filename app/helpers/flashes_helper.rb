module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fecth key.to_sym, key
  end

  def user_facing_falshes
    flash.to_hash.slice "alert", "notice","warning"
  end
end
