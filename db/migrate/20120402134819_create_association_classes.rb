class CreateAssociationClasses < ActiveRecord::Migration
  def self.up
    create_table :association_classes do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.boolean :visibility
      t.boolean :isSpecification
      t.boolean :isRoot
      t.boolean :isLeaf
      t.boolean :isAbstract
      t.boolean :isActive
      t.integer :package_id

      t.timestamps
    end
		add_column :uml_classes, :isAbstract, :boolean
  end

  def self.down
	  remove_column :uml_classes, :isAbstract
    drop_table :association_classes
  end
end
