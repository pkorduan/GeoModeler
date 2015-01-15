class Model < ActiveRecord::Base
  has_many :stereotypes, :dependent => :destroy
	has_many :packages, :dependent => :destroy
	has_many :diagrams
	has_many :diagram_elements
	has_many :uml_classes
	has_many :association_classes
	has_many :interfaces
	has_many :associations
	has_many :uml_attributes
	has_many :class_generalizations
	has_many :model_elements, :dependent => :destroy

	attr_accessor :xml_doc
	attr_accessor :logger

	def load
	  @logger = Logger.new "#{LOG_PATH}load_#{File.basename(xml_file_name)}.log"
		@logger.level = Logger::DEBUG

		@logger.debug "Lade Datei: #{xml_file_name}"
		@xml_doc = Nokogiri::XML(File.open(xml_file_name))

		model = @xml_doc.xpath("/XMI/XMI.content/UML:Model")[0]
		update_attributes(
		  :xmi_id => "#{model["xmi.id"]}",
			:name => "#{model["name"]}"
		)
		model_elements.destroy_all
	end
	
	def add_element element
	  ModelElement.create_from_element element
	end

	def find_packages
		packages.find(:all, :conditions => ["parent_package_id = 0"])
	end
	
end