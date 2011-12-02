# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddIncidentIdToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :incident_id, :integer
  end

  def self.down
    drop_column :patients, :incident_id
  end
end
