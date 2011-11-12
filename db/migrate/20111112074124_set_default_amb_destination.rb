class SetDefaultAmbDestination < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :hospital_id, :integer, :default => 1
  end

  def self.down
  end
end
