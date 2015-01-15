class UseCase < ActiveRecord::Base
	belongs_to :model
	belongs_to :package

	def self.load model
    model.logger.debug "Lade use_cases aus xml doc"
	  num_use_cases = 0

	  model.xml_doc.xpath(".//UML:UseCase").each do |use_case_node|
			if (!use_case_node["xmi.id"].nil?)
			  model.logger.debug "Lade use_case aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{use_case_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  use_case = UseCase.create({
  				:model_id => model.id,
					:package_id => model.packages.find_by_xmi_id(use_case_node.parent.parent['xmi.id']).id,
					:xmi_id => "#{use_case_node["xmi.id"]}",
					:name => "#{use_case_node["name"]}",
					:visibility => "#{use_case_node["visibility"]}",
					:isSpecification => "#{use_case_node["isSpecification"]}",
					:isRoot => "#{use_case_node["isRoot"]}",
					:isLeaf => "#{use_case_node["isLeaf"]}",
					:isAbstract => "#{use_case_node["isAbstract"]}"
				})
				model.logger.debug "use_case erzeugt: #{use_case.inspect}"
				model.add_element use_case
				num_use_cases += 1
			end	
		end
		num_use_cases	
	end
end
