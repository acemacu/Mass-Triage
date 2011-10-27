class UpdateIncidentFields < ActiveRecord::Migration
  def self.up
    change_column :incidents, :est_patient_count, :integer, :default => 0
    change_column :incidents, :requested_amb_count, :integer, :default => 0
  end

  def self.down
  end
end
