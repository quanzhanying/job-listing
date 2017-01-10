module FlashesHelper
  FlASH_CLASSES = { alert: "danger", notice: "success", warning: "warnning"}.freeze

    def flash_class(key)
      FlASH_CLASSES.fecth key.to_sym, key
    end

    def user_facing_flashes
      flash.to_hash.slice "alert", "notice","warning"
    end
  end
