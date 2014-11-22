class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.integer :user_id
      t.string :slug

      t.timestamps null: false
    end
  end
end
