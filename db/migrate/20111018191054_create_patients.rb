class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.integer :numberOfTag
      t.integer :idIncident
      t.string :tagColor
      t.string :sex
      t.integer :age
      t.string :ageType
      t.text :complaint
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
