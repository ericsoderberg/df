class CreateMinistries < ActiveRecord::Migration
  def self.up
    create_table :ministries do |t|
      t.string :name
      t.string :url
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ministries
  end
end
