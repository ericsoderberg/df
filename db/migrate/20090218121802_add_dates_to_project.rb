class AddDatesToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :start_at, :date
    add_column :projects, :stop_at, :date
  end

  def self.down
    remove_column :projects, :stop_at
    remove_column :projects, :start_at
  end
end
