class AddDropboxUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dropbox_uid, :string
  end
end
