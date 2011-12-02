# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class UpdateIncidentFields < ActiveRecord::Migration
  def self.up
    change_column :incidents, :est_patient_count, :integer, :default => 0
    change_column :incidents, :requested_amb_count, :integer, :default => 0
  end

  def self.down
  end
end
