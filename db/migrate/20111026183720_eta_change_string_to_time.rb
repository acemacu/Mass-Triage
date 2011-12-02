# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class EtaChangeStringToTime < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :eta, :timestamp
  end

  def self.down
  end
end
