class AddIsDeletedToIncidentTypes < ActiveRecord::Migration
  def self.up
    add_column :incident_types, :is_deleted, :boolean
  end

  def self.down
    remove_column :incident_types, :is_deleted
  end
end
