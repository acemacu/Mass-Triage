# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateHospitals < ActiveRecord::Migration
  def self.up
    create_table :hospitals do |t|
      t.integer :idHospital
      t.string :name
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :hospitals
  end
end
