class CreateInterfaces < ActiveRecord::Migration
  def self.up
    create_table :interfaces do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.boolean :visibility
      t.boolean :isSpecification
      t.boolean :isRoot
      t.boolean :isLeaf
      t.boolean :isAbstract
      t.integer :package_id

      t.timestamps
    end
  end

  def self.down
    drop_table :interfaces
  end
end
