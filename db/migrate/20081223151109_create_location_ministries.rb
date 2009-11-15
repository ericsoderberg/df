class CreateLocationMinistries < ActiveRecord::Migration
  def self.up
    create_table :location_ministries do |t|
      t.integer :ministry_id
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :location_ministries
  end
end
