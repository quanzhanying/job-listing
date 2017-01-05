module FlashesHelper
  FLASH_CLASSES = { alert: "danger", notice: "success", warning: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASSES.fetch key.to_sym, keyend
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notece", "warning"
  end
end
