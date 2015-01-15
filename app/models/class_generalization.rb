class ClassGeneralization < ActiveRecord::Base
  belongs_to :model
	belongs_to :package
	belongs_to :parent, :class_name => "UmlClass", :foreign_key => "parent_id" 
	belongs_to :child, :class_name => "UmlClass", :foreign_key => "child_id"

	def self.get_parent_and_child_xmi_ids xml
		xml_doc = Nokogiri::XML("<XMI xmlns:UML = 'org.omg.xmi.namespace.UML'>#{xml}</XMI>")
		parent_node = xml_doc.xpath("//UML:Generalization/UML:Generalization.parent/UML:Class/attribute::xmi.idref","UML" => "org.omg.xmi.namespace.UML")[0]
		parent_xmi_id = parent_node.nil? ? nil : parent_node.value 
		child_node = xml_doc.xpath("//UML:Generalization/UML:Generalization.child/UML:Class/attribute::xmi.idref","UML" => "org.omg.xmi.namespace.UML")[0]
		child_xmi_id = child_node.nil? ? nil : child_node.value
		
		return parent_xmi_id, child_xmi_id
	end	
	
	
	def self.load model
    model.logger.debug "Lade class_generalizations aus xml doc"
	  num_class_generalizations = 0
		model.class_generalizations.destroy_all

	  model.xml_doc.xpath(".//UML:Generalization").each do |class_generalization_node|
			if (!class_generalization_node["xmi.id"].nil?)
				model.logger.debug "Lade parent und child for class_generalizations aus xml:"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{class_generalization_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				parent_xmi_id, child_xmi_id = ClassGeneralization.get_parent_and_child_xmi_ids(class_generalization_node.to_s)
				model.logger.debug "Erzeuge class_generalization: #{class_generalization_node["xmi.id"]}"
				model.logger.debug "mit parent #{parent_xmi_id} und child #{child_xmi_id}"
				class_generalization = ClassGeneralization.create({
					:model_id => model.id,
					:package_id => model.packages.find_by_xmi_id(class_generalization_node.parent.parent['xmi.id']).id,
					:xmi_id => "#{class_generalization_node["xmi.id"]}",
					:parent_id => parent_xmi_id.nil? ? nil : model.uml_classes.find_by_xmi_id(parent_xmi_id).id,
					:child_id => child_xmi_id.nil? ? nil : model.uml_classes.find_by_xmi_id(child_xmi_id).id
				})
				model.logger.debug "Class generalization erzeugt: #{class_generalization.inspect}"
				model.add_element class_generalization				
				num_class_generalizations += 1
			end	
		end
		num_class_generalizations
	end
	
end
