# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateAmbulances < ActiveRecord::Migration
  def self.up
    create_table :ambulances do |t|
      t.integer :idAmbulance
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ambulances
  end
end
