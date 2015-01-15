class CreateClassGeneralizations < ActiveRecord::Migration
  def self.up
    create_table :class_generalizations do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.boolean :isSpecification
      t.integer :package_id
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
  end

  def self.down
    drop_table :class_generalizations
  end
end
