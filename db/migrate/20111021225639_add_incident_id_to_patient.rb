class AddIncidentIdToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :incident_id, :integer
  end

  def self.down
    drop_column :patients, :incident_id
  end
end
