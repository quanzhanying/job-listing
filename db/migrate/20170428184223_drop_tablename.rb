class DropTablename < ActiveRecord::Migration[5.0]
  def change
    def up
      drop_table :infos
    end
  end
end
