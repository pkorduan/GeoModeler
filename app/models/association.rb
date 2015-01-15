class Association < ActiveRecord::Base
  belongs_to :model
	belongs_to :package
	has_many :association_ends, :dependent => :destroy
	
	def self.load model
    model.logger.debug "Lade associations aus xml doc"
	  num_associations = 0

	  model.xml_doc.xpath(".//UML:Association").each do |association_node|
			if (!association_node["xmi.id"].nil?)
			  model.logger.debug "Lade association aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{association_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  association = Association.create({
  				:model_id => model.id,
					:xmi_id => "#{association_node["xmi.id"]}",
					:package_id => model.packages.find_by_xmi_id(association_node.parent.parent['xmi.id']).id,
					:name => "#{association_node["name"]}",
					:visibility => "#{association_node["visibility"]}",
					:isSpecification => "#{association_node["isSpecification"]}",
					:isRoot => "#{association_node["isRoot"]}",
					:isLeaf => "#{association_node["isLeaf"]}",
					:isAbstract => "#{association_node["isAbstract"]}"
				})
				model.logger.debug "association erzeugt: #{association.inspect}"
				model.add_element association
				num_associations += 1
			end
		end
		num_associations	
	end
end
