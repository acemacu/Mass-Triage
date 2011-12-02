# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddColumn < ActiveRecord::Migration
  def self.up
    add_column :ambulances, :incident_id, :integer
  end

  def self.down
    drop_column :ambulances, :incident_id
  end
end
