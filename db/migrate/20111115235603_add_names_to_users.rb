class AddNamesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :fname, :string
    add_column :users, :lname, :string
  end

  def self.down
    drop_column :users, :fname
    drop_column :users, :lname
  end
end
