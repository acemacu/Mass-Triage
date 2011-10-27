class CreateIncidents < ActiveRecord::Migration
  def self.up
    create_table :incidents do |t|
      t.integer :idIncident
      t.datetime :date
      t.string :type
      t.string :location
      t.float :longitude
      t.float :latitude
      t.datetime :dispatchTime
      t.datetime :arrivalTime
      t.datetime :endTime

      t.timestamps
    end
  end

  def self.down
    drop_table :incidents
  end
end
