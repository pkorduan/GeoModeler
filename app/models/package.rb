class Package < ActiveRecord::Base
	belongs_to :model	
  has_many :packages, :foreign_key => "parent_package_id", :dependent => :destroy
  belongs_to :package, :foreign_key => "parent_package_id"
  has_many :uml_classes, :dependent => :destroy
	has_many :association_classes, :dependent => :destroy
	has_many :interfaces, :dependent => :destroy
	has_many :actors, :dependent => :destroy
	has_many :use_cases, :dependent => :destroy	
	has_many :class_generalizations, :dependent => :destroy
	has_many :associations, :dependent => :destroy
	has_many :diagrams, :dependent => :destroy
	
	def self.load model
    model.logger.debug "Lade packages aus xml doc"
	  num_packages = 0
		model.packages.destroy_all

		package_nodes = model.xml_doc.xpath(".//UML:Package")
		model.logger.debug "#{package_nodes} package nodes gefunden"
	  package_nodes.each do |package_node|
			if (!package_node["xmi.id"].nil?)
			  model.logger.debug "Lade packages aus xml"
				#model.logger.debug "<!-- #Start############################ //-->"
				model.logger.debug "#{package_node.to_s[0..100]}..."
				#model.logger.debug "<!-- #Ende############################# //-->"	
				parent_package_node = package_node.parent.parent
				if parent_package_node.name == "Model"
				  package_id = 0
				else
				  package_id = model.packages.find_by_xmi_id(parent_package_node['xmi.id']).id
				end	
			  package = Package.create({
					:model_id => model.id,
					:parent_package_id => package_id, 
					:xmi_id => "#{package_node["xmi.id"]}",
					:name => "#{package_node["name"]}",
					:visibility => "#{package_node["visibility"]}",
					:isSpecification => "#{package_node["isSpecification"]}",
					:isRoot => "#{package_node["isRoot"]}",
					:isLeaf => "#{package_node["isLeaf"]}",
					:isAbstract => "#{package_node["isAbstract"]}"
				})
				model.logger.debug "Package erzeugt: #{package.inspect}"
				model.add_element package
				num_packages += 1
			end	
		end
		num_packages	
	end	
end
