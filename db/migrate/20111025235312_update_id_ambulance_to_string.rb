class UpdateIdAmbulanceToString < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :idAmbulance, :string
  end

  def self.down
  end
end
