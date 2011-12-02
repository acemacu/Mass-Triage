# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateIncidentTypes < ActiveRecord::Migration
  def self.up
    create_table :incident_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :incident_types
  end
end
