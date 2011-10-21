class AddColumn < ActiveRecord::Migration
  def self.up
    add_column :ambulances, :incident_id, :integer
  end

  def self.down
    drop_column :ambulances, :incident_id
  end
end
