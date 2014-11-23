class AddTextToMedia < ActiveRecord::Migration
  def change
    add_column :media, :text, :string
  end
end
