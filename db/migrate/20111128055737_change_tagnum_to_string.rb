class ChangeTagnumToString < ActiveRecord::Migration
  def self.up
    change_column :patients, :numberOfTag, :string
  end

  def self.down
    change_column :patients, :numberOfTag, :integer
  end
end
