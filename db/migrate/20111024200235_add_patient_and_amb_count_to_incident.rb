# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddPatientAndAmbCountToIncident < ActiveRecord::Migration
  def self.up
    add_column :incidents, :est_patient_count, :integer
    add_column :incidents, :requested_amb_count, :integer
  end

  def self.down
    drop_column :incidents, :est_patient_count
    drop_column :incidents, :requested_amb_count
  end
end
