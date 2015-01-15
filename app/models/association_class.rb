class AssociationClass < ActiveRecord::Base
	belongs_to :model
	belongs_to :package
	has_many :uml_attributes, :foreign_key => "uml_class_id", :dependent => :destroy
	has_many :spezializations, :class_name => "ClassGeneralization", :foreign_key => "child_id", :dependent => :destroy
	has_one :generalization, :class_name => "ClassGeneralization", :foreign_key => "parent_id"

	def self.load model
    model.logger.debug "Lade assoziation_classes aus xml doc"
	  num_association_classes = 0
		model.association_classes.destroy_all

	  model.xml_doc.xpath(".//UML:AssociationClass").each do |association_class_node|
			if (!association_class_node["xmi.id"].nil?)
			  model.logger.debug "Lade association_class aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{association_class_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  association_class = AssociationClass.create({
					:model_id => model.id,
					:package_id => model.packages.find_by_xmi_id(association_class_node.parent.parent['xmi.id']).id,
					:xmi_id => "#{association_class_node["xmi.id"]}",
					:name => "#{association_class_node["name"]}",
					:visibility => "#{association_class_node["visibility"]}",
					:isSpecification => "#{association_class_node["isSpecification"]}",
					:isRoot => "#{association_class_node["isRoot"]}",
					:isLeaf => "#{association_class_node["isLeaf"]}",
					:isAbstract => "#{association_class_node["isAbstract"]}",
					:isActive => "#{association_class_node["isActive"]}"	
				})
				model.logger.debug "AssociationClass erzeugt: #{association_class.inspect}"
				model.add_element association_class
				num_association_classes += 1
			end	
		end
		num_association_classes	
	end
end