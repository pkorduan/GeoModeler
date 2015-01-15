class CreateDiagrams < ActiveRecord::Migration
  def self.up
    create_table :diagrams do |t|
      t.string :xmi_id
      t.string :name
      t.integer :model_id
      t.integer :package_id
      t.string :diagramType
      t.string :toolName
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :diagrams
  end
end
