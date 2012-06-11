class AddIdentityUniqueness < ActiveRecord::Migration
  def self.up
    add_column :users, :identity, :string
    add_index :users, :identity, :unique => true
  end

  def self.down
    remove_column :users, :identity
    remove_index :users, :identity
  end
end
