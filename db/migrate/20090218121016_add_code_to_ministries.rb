class AddCodeToMinistries < ActiveRecord::Migration
  def self.up
    add_column :ministries, :code, :string
  end

  def self.down
    remove_column :ministries, :code
  end
end
