class AddDescriptionToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :desc, :string
  end

  def self.down
    remove_column :users, :desc
  end
end
