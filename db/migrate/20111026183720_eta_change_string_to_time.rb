class EtaChangeStringToTime < ActiveRecord::Migration
  def self.up
    change_column :ambulances, :eta, :datetime
  end

  def self.down
  end
end
