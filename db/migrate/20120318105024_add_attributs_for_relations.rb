class AddAttributsForRelations < ActiveRecord::Migration
  def self.up
    add_column :packages, :model_id, :integer
		add_column :packages, :parent_package_id, :integer
		add_column :models, :xmi_id, :string
  end

  def self.down
		remove_column :models, :xmi_id
		remove_column :packages, :parent_package_id
		remove_column :packages, :model_id
  end
end
