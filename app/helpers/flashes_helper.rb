module FlashesHelper

FLASHES_CLASSES = {:notice => "success", :warning => "warning", :alert => "danger"}.freeze

def user_facing_flashes(flashes)
  flashes.to_hash.slice "alert", "notice", "warning"
end

def flash_class(key)
    FLASHES_CLASSES.fetch key.to_sym, key
end

end
