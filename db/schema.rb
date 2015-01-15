# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120402134819) do

  create_table "association_classes", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.boolean  "visibility"
    t.boolean  "isSpecification"
    t.boolean  "isRoot"
    t.boolean  "isLeaf"
    t.boolean  "isAbstract"
    t.boolean  "isActive"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "class_generalizations", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.boolean  "isSpecification"
    t.integer  "package_id"
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagrams", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.integer  "package_id"
    t.string   "diagramType"
    t.string   "toolName"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfaces", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.boolean  "visibility"
    t.boolean  "isSpecification"
    t.boolean  "isRoot"
    t.boolean  "isLeaf"
    t.boolean  "isAbstract"
    t.integer  "package_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", :force => true do |t|
    t.string   "name"
    t.string   "xml_file_name"
    t.string   "owner_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "xmi_id"
  end

  create_table "packages", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.string   "visibility"
    t.boolean  "isSpecification"
    t.boolean  "isRoot"
    t.boolean  "isLeaf"
    t.boolean  "isAbstract"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
    t.integer  "parent_package_id"
  end

  create_table "stereotypes", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.boolean  "isSpecification"
    t.boolean  "isRoot"
    t.boolean  "isLeaf"
    t.boolean  "isAbstract"
    t.string   "baseClass"
    t.integer  "stereotype_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uml_attributes", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.integer  "model_id"
    t.integer  "uml_class_id"
    t.string   "visibility"
    t.boolean  "isSpecification"
    t.string   "ownerSpace"
    t.string   "changeability"
    t.string   "targetScope"
    t.string   "ordering"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uml_classes", :force => true do |t|
    t.string   "xmi_id"
    t.string   "name"
    t.string   "visibility"
    t.boolean  "isSpecification"
    t.boolean  "isRoot"
    t.boolean  "isLeaf"
    t.boolean  "isActive"
    t.integer  "package_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "isAbstract"
  end

end
