class CreateUmlClasses < ActiveRecord::Migration
  def self.up
    create_table :uml_classes do |t|
      t.string :xmi_id
      t.string :name
      t.string :visibility
      t.boolean :isSpecification
      t.boolean :isRoot
      t.boolean :isLeaf
      t.boolean :isActive
      t.integer :package_id
      t.integer :model_id

      t.timestamps
    end
  end

  def self.down
    drop_table :uml_classes
  end
end
