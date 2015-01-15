class CreatePackages < ActiveRecord::Migration
  def self.up
    create_table :packages do |t|
      t.string :xmi_id
      t.string :name
      t.string :visibility
      t.boolean :isSpecification
      t.boolean :isRoot
      t.boolean :isLeaf
      t.boolean :isAbstract

      t.timestamps
    end
  end

  def self.down
    drop_table :packages
  end
end
