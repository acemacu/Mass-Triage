class AddDescriptionToIncident < ActiveRecord::Migration
  def self.up
    add_column :incidents, :description, :string
  end

  def self.down
    remove_column :incidents, :description
  end
end
