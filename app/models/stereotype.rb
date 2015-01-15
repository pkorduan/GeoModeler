class Stereotype < ActiveRecord::Base
	belongs_to :model
	
	def self.load model
    model.logger.debug "Lade stereotypes aus xml doc"
	  num_stereotypes = 0
		model.stereotypes.destroy_all

	  model.xml_doc.xpath(".//UML:Stereotype").each do |stereotype_node|
			if (!stereotype_node["xmi.id"].nil?)
			  model.logger.debug "Lade stereotype aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{stereotype_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  stereotype = Stereotype.create({
  				:model_id => model.id,
					:name => stereotype_node["name"],
					:xmi_id => stereotype_node["xmi.id"],
					:isSpecification => "#{stereotype_node["isSpecification"]}",
					:isRoot => "#{stereotype_node["isRoot"]}",
					:isLeaf => "#{stereotype_node["isLeaf"]}",
					:isAbstract => "#{stereotype_node["isAbstract"]}",
					:baseClass => "#{stereotype_node.first_element_child().inner_text()}"
				})
				model.logger.debug "stereotype erzeugt: #{stereotype.inspect}"
				model.add_element stereotype
				num_stereotypes += 1
			end
		end
		num_stereotypes	
	end	
end
