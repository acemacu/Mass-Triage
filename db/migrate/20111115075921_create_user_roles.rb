class CreateUserRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end
    
    add_column :users, :role_id, :integer
  end

  def self.down
    drop_table :roles
    drop_column :users, :role_id
  end
end
