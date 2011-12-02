# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class IncidentTableChangeTypeToIncidentType < ActiveRecord::Migration
  def self.up
    rename_column :incidents, :type, :incident_type
  end

  def self.down
  end
end
