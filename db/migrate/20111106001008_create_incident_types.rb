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
