class CreateTrips < ActiveRecord::Migration
  def self.up
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :start_at
      t.date :stop_at

      t.timestamps
    end
  end

  def self.down
    drop_table :trips
  end
end
