class CreatePatientUpdates < ActiveRecord::Migration
  def self.up
    create_table :patient_updates do |t|
      t.integer :incident_id
      t.integer :patient_id
      t.string :previous
      t.string :updated
      t.string :value
      t.datetime :updateTime
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_updates
  end
end
