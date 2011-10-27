class CreateResponders < ActiveRecord::Migration
  def self.up
    create_table :responders do |t|
      t.integer :idResponder
      t.string :firstName
      t.string :lastName
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :responders
  end
end
