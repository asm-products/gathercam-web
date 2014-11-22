class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :event_id
      t.string :social_id
      t.string :media_url

      t.timestamps null: false
    end
  end
end
