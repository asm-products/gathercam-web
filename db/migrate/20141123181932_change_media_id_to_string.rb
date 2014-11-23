class ChangeMediaIdToString < ActiveRecord::Migration
  def change
    change_column :media, :media_id, :string
  end
end
