class RemoveUnusedTablesAndColumns < ActiveRecord::Migration
  def self.up
    drop_table :configurables
    remove_column :incidents, :incident_type
    remove_column :patients, :idIncidents
    drop_table :responders
    remove_column :users, :responder_id
  end

  def self.down
  end
end
