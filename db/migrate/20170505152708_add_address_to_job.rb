class AddAddressToJob < ActiveRecord::Migration[5.0]
  def change
    # 增加地址栏位
    add_column :jobs, :address, :string

    # 增加经纬度栏位
    add_column :jobs, :longitude, :float
    add_column :jobs, :latitude, :float
  end
end
