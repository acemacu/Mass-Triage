class AddIsDeletedToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :is_deleted, :boolean
  end

  def self.down
    remove_column :patients, :is_deleted
  end
end
