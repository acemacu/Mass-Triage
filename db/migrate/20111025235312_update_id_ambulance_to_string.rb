# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class UpdateIdAmbulanceToString < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :idAmbulance, :string
  end

  def self.down
  end
end
