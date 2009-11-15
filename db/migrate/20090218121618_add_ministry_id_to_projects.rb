class AddMinistryIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :ministry_id, :integer
  end

  def self.down
    remove_column :projects, :ministry_id
  end
end
