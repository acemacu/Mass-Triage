class AddMoreAmbColumns < ActiveRecord::Migration
  def self.up
    add_column :ambulances, :status, :string
    add_column :ambulances, :hospital_id, :integer
    add_column :ambulances, :patient_id, :integer
    add_column :ambulances, :eta, :string
  end

  def self.down
    add_column :ambulances, :status
    add_column :ambulances, :hospital_id
    add_column :ambulances, :patient_id
    add_column :ambulances, :eta
  end
end
