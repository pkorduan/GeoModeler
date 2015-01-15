class Diagram < ActiveRecord::Base
	belongs_to :package
	belongs_to :model
	has_many :diagram_elements, :dependent => :destroy
	
	def self.load model
    model.logger.debug "Lade diagrams aus xml doc"
	  num_diagrams = 0

	  model.xml_doc.xpath(".//UML:Diagram").each do |diagram_node|
			if (!diagram_node["xmi.id"].nil?)
			  model.logger.debug "Lade diagram aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{diagram_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  diagram = Diagram.create({
  				:model_id => model.id,
					:name => "#{diagram_node["name"]}",
					:xmi_id => "#{diagram_node["xmi.id"]}",
					:diagramType => "#{diagram_node["diagramType"]}",
					:package_id => model.packages.find_by_xmi_id(diagram_node["owner"]).id,
					:toolName => "#{diagram_node["toolName"]}"
				})
				model.logger.debug "Diagram erzeugt: #{diagram.inspect}"
				model.add_element diagram
				num_diagrams += 1
			end
		end
		num_diagrams	
	end
end
