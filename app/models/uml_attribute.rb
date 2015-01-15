class UmlAttribute < ActiveRecord::Base
  belongs_to :model
  belongs_to :uml_class
	belongs_to :association_class, :foreign_key => "uml_class_id"
	belongs_to :interface, :foreign_key => "uml_class_id"
	
	def self.load model
    model.logger.debug "Lade uml_attributes aus xml doc"
	  num_uml_attributes = 0
		model.uml_attributes.destroy_all

	  model.xml_doc.xpath(".//UML:Attribute").each do |uml_attribute_node|
			if (!uml_attribute_node["xmi.id"].nil?)
			  model.logger.debug "Lade uml_attribute aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{uml_attribute_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
				parent_class_node = uml_attribute_node.parent.parent
				case parent_class_node.name
				  when "AssociationClass"
				    class_id = model.association_classes.find_by_xmi_id(parent_class_node['xmi.id']).id
				  when "Interface"
				    class_id = model.interfaces.find_by_xmi_id(parent_class_node['xmi.id']).id					
					else
				    class_id = model.uml_classes.find_by_xmi_id(parent_class_node['xmi.id']).id
				end	

			  uml_attribute = UmlAttribute.create({
					:model_id => model.id,
					:uml_class_id => class_id,
					:xmi_id => "#{uml_attribute_node["xmi.id"]}",
					:name => "#{uml_attribute_node["name"]}",
					:visibility => "#{uml_attribute_node["visibility"]}",
					:isSpecification => "#{uml_attribute_node["isSpecification"]}",
					:ownerSpace => "#{uml_attribute_node["ownerSpace"]}",
					:changeability => "#{uml_attribute_node["changeability"]}",
					:targetScope => "#{uml_attribute_node["targetScope"]}",
					:ordering => "#{uml_attribute_node["ordering"]}"						
				})
				model.logger.debug "UmlAttribute erzeugt: #{uml_attribute.inspect}"
				model.add_element uml_attribute
				num_uml_attributes += 1
			end	
		end
		num_uml_attributes	
	end

end
