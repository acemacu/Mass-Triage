class AddIncidentStatus < ActiveRecord::Migration
  def self.up
    add_column :incidents, :status, :boolean, :default => true
  end

  def self.down
    drop_column :incidents, :status
  end
end
