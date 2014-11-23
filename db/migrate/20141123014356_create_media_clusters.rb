class CreateMediaClusters < ActiveRecord::Migration
  def change
    create_table :media_clusters do |t|
      t.string :title

      t.timestamps null: false
    end
    create_table :media_media_clusters do |t|
      t.integer :media_id
      t.integer :media_clusters_id
    end
  end
end
