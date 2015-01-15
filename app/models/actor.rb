class Actor < ActiveRecord::Base
	belongs_to :model
	belongs_to :package

	def self.load model
    model.logger.debug "Lade actors aus xml doc"
	  num_actors = 0

	  model.xml_doc.xpath(".//UML:Actor").each do |actor_node|
			if (!actor_node["xmi.id"].nil?)
			  model.logger.debug "Lade actor aus xml"
				model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{actor_node.to_s}"
				model.logger.debug "<!-- #Ende############################# //-->"	
				
			  actor = Actor.create({
  				:model_id => model.id,
					:package_id => model.packages.find_by_xmi_id(actor_node.parent.parent['xmi.id']).id,
					:xmi_id => "#{actor_node["xmi.id"]}",
					:name => "#{actor_node["name"]}",
					:visibility => "#{actor_node["visibility"]}",
					:isSpecification => "#{actor_node["isSpecification"]}",
					:isRoot => "#{actor_node["isRoot"]}",
					:isLeaf => "#{actor_node["isLeaf"]}",
					:isAbstract => "#{actor_node["isAbstract"]}"
				})
				model.logger.debug "Actor erzeugt: #{actor.inspect}"
				model.add_element actor
				num_actors += 1
			end	
		end
		num_actors	
	end

end
