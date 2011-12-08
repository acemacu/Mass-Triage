class AddIsDeletedToHospitals < ActiveRecord::Migration
  def self.up
    add_column :hospitals, :is_deleted, :boolean
  end

  def self.down
    remove_column :hospitals, :is_deleted
  end
end
