class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.string :name
      t.string :xml_file_name
      t.string :owner_name

      t.timestamps
    end
  end

  def self.down
    drop_table :models
  end
end
