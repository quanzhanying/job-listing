module FlashesHelper
  FLASH_CLASS = { alert: "danger", notice: "success", warming: "warning"}.freeze

  def flash_class(key)
    FLASH_CLASS.fetch key.to_sym, key
  end

  def user_facting_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end

end
