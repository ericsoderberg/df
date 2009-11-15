class AddParameterizedNameToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :parameterized_name, :string
  end

  def self.down
    remove_column :pages, :parameterized_name
  end
end
