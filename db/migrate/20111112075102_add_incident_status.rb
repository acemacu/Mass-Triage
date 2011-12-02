# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddIncidentStatus < ActiveRecord::Migration
  def self.up
    add_column :incidents, :status, :boolean, :default => true
  end

  def self.down
    drop_column :incidents, :status
  end
end
