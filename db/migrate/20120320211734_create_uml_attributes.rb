class CreateUmlAttributes < ActiveRecord::Migration
  def self.up
    create_table :uml_attributes do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.integer :uml_class_id
      t.string :visibility
      t.boolean :isSpecification
      t.string :ownerSpace
      t.string :changeability
      t.string :targetScope
      t.string :ordering

      t.timestamps
    end
  end

  def self.down
    drop_table :uml_attributes
  end
end
