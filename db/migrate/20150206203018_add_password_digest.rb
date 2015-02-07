class AddPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :users, :password
    add_column :entries, :user_id, :integer
    add_foreign_key :entries, :users
    add_column :users, :password_digest, :text
  end
end
