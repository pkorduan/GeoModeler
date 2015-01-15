class DiagramElement < ActiveRecord::Base
  belongs_to :model
	belongs_to :diagram
	
	def self.load model
    model.logger.debug "Lade diagram_elements aus xml doc"
	  num_diagram_elements = 0

	  model.xml_doc.xpath(".//UML:DiagramElement").each do |diagram_element_node|
			model.logger.debug "Lade diagram_element aus xml"
			model.logger.debug "<!-- #Start############################ //-->"
			model.logger.debug "#{diagram_element_node.to_s}"
			model.logger.debug "<!-- #Ende############################# //-->"	
			
			diagram_element = DiagramElement.create({
				:model_id => model.id,
				:geometry => "#{diagram_element_node["geometry"]}",
				:subject => "#{diagram_element_node["subject"]}",
				:seqno => diagram_element_node["seqno"].to_i,
				:style => "#{diagram_element_node["style"]}",
				:diagram_id => model.diagrams.find_by_xmi_id(diagram_element_node.parent.parent['xmi.id']).id
			})
			model.logger.debug "diagram_element erzeugt: #{diagram_element.inspect}"
			num_diagram_elements += 1
		end
		num_diagram_elements	
	end
	
	def div_id
    "#{diagram.xmi_id}_#{id}"
	end
end
