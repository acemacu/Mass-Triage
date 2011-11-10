class AddRespIdtoUser < ActiveRecord::Migration
  def self.up
    add_column :users, :responder_id, :integer
  end

  def self.down
    drop_column :users, :responer_id
  end
end
