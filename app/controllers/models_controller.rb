class ModelsController < ApplicationController
  # GET /models
  # GET /models.xml
  def index
    @models = Model.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @models }
    end
  end

	def load
    @model = Model.find(params[:id])
		@model.load
		@num_stereotypes = Stereotype.load @model
		@num_packages = Package.load @model
		@num_uml_classes = UmlClass.load @model
		@num_association_classes = AssociationClass.load @model
		@num_interfaces = Interface.load @model
    @num_actors = Actor.load @model
		@num_use_cases = UseCase.load @model
		@num_uml_attributes = UmlAttribute.load @model
		@num_class_generalizations = ClassGeneralization.load @model
		@num_associations = Association.load @model
		@num_association_ends = AssociationEnd.load @model
		@num_diagrams = Diagram.load @model
		@num_diagram_elements = DiagramElement.load @model
		
    respond_to do |format|
      format.html # load.html.erb
      format.xml  { render :xml => @models }
    end
  end

	def statistic
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # statistic.html.erb
      format.xml  { render :xml => @models }
    end
  end
	
  def tree
    @model = Model.find(params[:id])
		
		@packages = @model.find_packages

    respond_to do |format|
      format.html # tree.html.erb
      format.xml  { render :xml => @models }
    end
  end	
	
  # GET /models/1
  # GET /models/1.xml
  def show
    @model = Model.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model }
    end
  end

  # GET /models/new
  # GET /models/new.xml
  def new
    @model = Model.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model }
    end
  end

  # GET /models/1/edit
  def edit
    @model = Model.find(params[:id])
  end

  # POST /models
  # POST /models.xml
  def create
    @model = Model.new(params[:model])

    respond_to do |format|
      if @model.save
        format.html { redirect_to(@model, :notice => 'Model was successfully created.') }
        format.xml  { render :xml => @model, :status => :created, :location => @model }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.xml
  def update
    @model = Model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to(@model, :notice => 'Model was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.xml
  def destroy
    @model = Model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to(models_url) }
      format.xml  { head :ok }
    end
  end
end
