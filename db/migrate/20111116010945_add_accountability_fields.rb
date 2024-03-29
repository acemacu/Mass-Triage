# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class AddAccountabilityFields < ActiveRecord::Migration
  def self.up
    add_column :incidents, :creating_user_id, :integer
    add_column :patients, :creating_user_id, :integer
    add_column :ambulances, :adding_user_id, :integer
    add_column :incidents, :closing_user_id, :integer
  end

  def self.down
    remove_column :incidents, :creating_user_id
    remove_column :patients, :creating_user_id
    remove_column :ambulances, :adding_user_id
    remove_column :incidents, :closing_user_id
  end
end
