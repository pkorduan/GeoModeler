class UmlClass < ActiveRecord::Base
	belongs_to :model
	belongs_to :package
	has_many :uml_attributes, :dependent => :destroy
	has_many :spezializations, :class_name => "ClassGeneralization", :foreign_key => "child_id", :dependent => :destroy
	has_one :generalization, :class_name => "ClassGeneralization", :foreign_key => "parent_id"

	def self.load model
    model.logger.debug "Lade uml_classes aus xml doc"
	  num_uml_classes = 0
		model.uml_classes.destroy_all

	  model.xml_doc.xpath(".//UML:Class").each do |uml_class_node|
			if (!uml_class_node["xmi.id"].nil?)
			  model.logger.debug "Lade uml_class aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{uml_class_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  uml_class = UmlClass.create({
  				:model_id => model.id,
					:package_id => model.packages.find_by_xmi_id(uml_class_node.parent.parent['xmi.id']).id,
					:xmi_id => "#{uml_class_node["xmi.id"]}",
					:name => "#{uml_class_node["name"]}",
					:visibility => "#{uml_class_node["visibility"]}",
					:isSpecification => "#{uml_class_node["isSpecification"]}",
					:isRoot => "#{uml_class_node["isRoot"]}",
					:isLeaf => "#{uml_class_node["isLeaf"]}",
					:isAbstract => "#{uml_class_node["isAbstract"]}",
					:isActive => "#{uml_class_node["isActive"]}"
				})
				model.logger.debug "UmlClass erzeugt: #{uml_class.inspect}"
				model.add_element uml_class
				num_uml_classes += 1
			end	
		end
		num_uml_classes	
	end
end
