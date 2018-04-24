class AddFacebookUidToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_uid, :integer
  end
end
