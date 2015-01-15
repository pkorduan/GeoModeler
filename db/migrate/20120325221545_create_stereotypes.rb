class CreateStereotypes < ActiveRecord::Migration
  def self.up
    create_table :stereotypes do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.boolean :isSpecification
      t.boolean :isRoot
      t.boolean :isLeaf
      t.boolean :isAbstract
      t.string :baseClass
      t.integer :stereotype_id

      t.timestamps
    end
  end

  def self.down
    drop_table :stereotypes
  end
end
