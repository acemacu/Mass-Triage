class AddIncidentTypeToIncident < ActiveRecord::Migration
  def self.up
    add_column :incidents, :incident_type_id, :integer
  end

  def self.down
    drop_column :incidents, :incident_type_id
  end
end
