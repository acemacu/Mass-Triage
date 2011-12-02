# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddMoreAmbColumns < ActiveRecord::Migration
  def self.up
    add_column :ambulances, :status, :string
    add_column :ambulances, :hospital_id, :integer
    add_column :ambulances, :patient_id, :integer
    add_column :ambulances, :eta, :datetime
  end

  def self.down
    add_column :ambulances, :status
    add_column :ambulances, :hospital_id
    add_column :ambulances, :patient_id
    add_column :ambulances, :eta
  end
end
