# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.integer :est_patient_count, :default => 0
      t.integer :requested_amb_count, :default => 0
      t.integer :incident_id

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
