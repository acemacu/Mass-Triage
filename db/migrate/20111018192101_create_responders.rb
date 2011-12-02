# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateResponders < ActiveRecord::Migration
  def self.up
    create_table :responders do |t|
      t.integer :idResponder
      t.string :firstName
      t.string :lastName
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :responders
  end
end
