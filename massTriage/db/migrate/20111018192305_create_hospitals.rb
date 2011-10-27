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
