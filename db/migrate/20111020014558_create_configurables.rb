# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class CreateConfigurables < ActiveRecord::Migration
  def self.up
    create_table :configurables do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
    
    add_index :configurables, :name
  end

  def self.down
    remove_index :configurables, :name
    drop_table :configurables
  end
end