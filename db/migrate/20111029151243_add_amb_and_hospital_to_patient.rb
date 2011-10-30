class AddAmbAndHospitalToPatient < ActiveRecord::Migration
  def self.up
    add_column :patients, :ambulance_id, :integer
    add_column :patients, :hospital_id, :integer
  end

  def self.down
    drop_column :patients, :ambulance_id
    drop_column :patients, :hospital_id
  end
end
