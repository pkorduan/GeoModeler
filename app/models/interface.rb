class Interface < ActiveRecord::Base
	belongs_to :model
	belongs_to :package
	has_many :uml_attributes, :foreign_key => "uml_class_id", :dependent => :destroy
	
	def self.load model
    model.logger.debug "Lade interfaces aus xml doc"
	  num_interfaces = 0
		model.interfaces.destroy_all

	  model.xml_doc.xpath(".//UML:Interface").each do |interface_node|
			if (!interface_node["xmi.id"].nil?)
				model.logger.debug "Erzeuge interface: #{interface_node["xmi.id"]}"
			  interface = Interface.create({
				  :model_id => model.id,
					:xmi_id => "#{interface_node["xmi.id"]}",
					:name => "#{interface_node["name"]}",
					:visibility => "#{interface_node["visibility"]}",
					:isSpecification => "#{interface_node["isSpecification"]}",
					:isRoot => "#{interface_node["isRoot"]}",
					:isLeaf => "#{interface_node["isLeaf"]}",
					:isAbstract => "#{interface_node["isAbstract"]}",
					:package_id => model.packages.find_by_xmi_id(interface_node.parent.parent['xmi.id']).id
				})
				model.logger.debug "Interface erzeugt: #{interface.inspect}"
				model.add_element interface
				num_interfaces += 1
			end	
		end
		num_interfaces
	end
	
end
