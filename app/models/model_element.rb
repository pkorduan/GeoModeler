class ModelElement < ActiveRecord::Base
  belongs_to :model

	def self.create_from_element element
		ModelElement.create({
			:xmi_id => element.xmi_id,
			:class_name => element.class.name,
			:element_id => element.id,
			:name => ((element.name.nil? or element.name.empty?) ? element.class.name : element.name),
			:model_id => element.model.id
		})
	end	

end
