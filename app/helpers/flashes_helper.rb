module FlashesHelper
  FLASHES_CLASSES = { alert: "danger", notice:"success", warining:"warining"}.freeze
  def flash_class(key)
    FLASHES_CLASSES.fetch key.to_sym, key
  end

  def user_facing_flashes
    flash.to_hash.slice "alert", "notice", "warning"
  end
end
