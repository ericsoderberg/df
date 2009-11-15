class AddMinistryIdToTrips < ActiveRecord::Migration
  def self.up
    add_column :trips, :ministry_id, :integer
  end

  def self.down
    remove_column :trips, :ministry_id
  end
end
