class AddMediaIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :media_id, :float
  end
end
