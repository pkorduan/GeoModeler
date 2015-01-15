class AssociationEnd < ActiveRecord::Base
  belongs_to :model
	belongs_to :association
	
	def self.load model
    model.logger.debug "Lade association_ends aus xml doc"
	  num_association_ends = 0

	  model.xml_doc.xpath(".//UML:AssociationEnd").each do |association_end_node|
			if (!association_end_node["xmi.id"].nil?)
			  model.logger.debug "Lade association_end aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{association_end_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
				new_association = model.associations.find_by_xmi_id(association_end_node.parent.parent['xmi.id'])
				new_association_id = (new_association.nil? ? 0 : new_association.id)
				
				multiplicity_node = association_end_node.xpath('.//UML:Multiplicity')[0]
				multiplicity_range_node = association_end_node.xpath('.//UML:MultiplicityRange')[0]
				participant_nodes = association_end_node.xpath('.//UML:AssociationEnd.participant')
			  participant_node = participant_nodes[0].first_element_child() if participant_nodes.length > 0
				
			  association_end = AssociationEnd.create({
  				:model_id => model.id,
					:xmi_id => "#{association_end_node["xmi.id"]}",
					:association_id => new_association_id,
					:name => "#{association_end_node["name"]}",
					:visibility => "#{association_end_node["visibility"]}",
					:isSpecification => "#{association_end_node["isSpecification"]}",
					:isNavigable => "#{association_end_node["isNavigable"]}",
					:aggregation => "#{association_end_node["aggregation"]}",
					:targetScope => "#{association_end_node["targetScope"]}",
					:multiplicity_xmi_id => multiplicity_node['xmi.id'],
					:multiplicity_range_xmi_id => multiplicity_range_node['xmi.id'],
					:multiplicity_range_lower => multiplicity_range_node['lower'],
					:multiplicity_range_upper => multiplicity_range_node['upper'],
					:participant_type => participant_node.nil? ? nil : participant_node.name,
					:participant_xmi_id => participant_node.nil? ? nil : participant_node['xmi.idref']
				})
				model.logger.debug "association_end erzeugt: #{association_end.inspect}"
				model.add_element association_end
				num_association_ends += 1
			end
		end
		num_association_ends	
	end
end
