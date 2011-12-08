class AddIsDeletedToAmbulances < ActiveRecord::Migration
  def self.up
    add_column :ambulances, :is_deleted, :boolean
  end

  def self.down
    remove_column :ambulances, :is_deleted
  end
end
