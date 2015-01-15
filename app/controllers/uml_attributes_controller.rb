class UmlAttributesController < ApplicationController
  # GET /uml_attributes
  # GET /uml_attributes.xml
  def index
    @uml_attributes = UmlAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uml_attributes }
    end
  end

  # GET /uml_attributes/1
  # GET /uml_attributes/1.xml
  def show
    @uml_attribute = UmlAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uml_attribute }
    end
  end

  # GET /uml_attributes/new
  # GET /uml_attributes/new.xml
  def new
    @uml_attribute = UmlAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uml_attribute }
    end
  end

  # GET /uml_attributes/1/edit
  def edit
    @uml_attribute = UmlAttribute.find(params[:id])
  end

  # POST /uml_attributes
  # POST /uml_attributes.xml
  def create
    @uml_attribute = UmlAttribute.new(params[:uml_attribute])

    respond_to do |format|
      if @uml_attribute.save
        format.html { redirect_to(@uml_attribute, :notice => 'UmlAttribute was successfully created.') }
        format.xml  { render :xml => @uml_attribute, :status => :created, :location => @uml_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uml_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uml_attributes/1
  # PUT /uml_attributes/1.xml
  def update
    @uml_attribute = UmlAttribute.find(params[:id])

    respond_to do |format|
      if @uml_attribute.update_attributes(params[:uml_attribute])
        format.html { redirect_to(@uml_attribute, :notice => 'UmlAttribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uml_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uml_attributes/1
  # DELETE /uml_attributes/1.xml
  def destroy
    @uml_attribute = UmlAttribute.find(params[:id])
    @uml_attribute.destroy

    respond_to do |format|
      format.html { redirect_to(uml_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
