class IncidentTableChangeTypeToIncidentType < ActiveRecord::Migration
  def self.up
    rename_column :incidents, :type, :incident_type
  end

  def self.down
  end
end
