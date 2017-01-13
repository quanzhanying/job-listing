module FlashesHelper
  FLASH_CLASSED = { alert:"danger",notice:"success",warning:"warning"}.freeze
    def flash_class(key)
      FLASH_CLASSED.FETCH key.to_sym, key

    end

    def user_facing_flashes
      flash.to_hash.slice "alert","notice","warning"
    end
  end
