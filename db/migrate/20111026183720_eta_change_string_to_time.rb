class EtaChangeStringToTime < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :eta, :timestamp
  end

  def self.down
  end
end
