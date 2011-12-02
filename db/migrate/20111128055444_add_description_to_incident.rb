# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddDescriptionToIncident < ActiveRecord::Migration
  def self.up
    add_column :incidents, :description, :string
  end

  def self.down
    remove_column :incidents, :description
  end
end
