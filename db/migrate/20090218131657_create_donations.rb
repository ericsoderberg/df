class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :user_id
      t.integer :project_id
      t.float :amount
      t.boolean :received

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
