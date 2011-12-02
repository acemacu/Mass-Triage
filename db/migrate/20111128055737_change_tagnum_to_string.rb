# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class ChangeTagnumToString < ActiveRecord::Migration
  def self.up
    change_column :patients, :numberOfTag, :string
  end

  def self.down
    change_column :patients, :numberOfTag, :integer
  end
end
