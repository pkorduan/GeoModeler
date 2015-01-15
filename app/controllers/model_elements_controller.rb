class ModelElementsController < ApplicationController
  # GET /model_elements
  # GET /model_elements.xml
  def index
    @model_elements = ModelElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @model_elements }
    end
  end

  # GET /model_elements/1
  # GET /model_elements/1.xml
  def show
    @model_element = ModelElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @model_element }
    end
  end

  # GET /model_elements/new
  # GET /model_elements/new.xml
  def new
    @model_element = ModelElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @model_element }
    end
  end

  # GET /model_elements/1/edit
  def edit
    @model_element = ModelElement.find(params[:id])
  end

  # POST /model_elements
  # POST /model_elements.xml
  def create
    @model_element = ModelElement.new(params[:model_element])

    respond_to do |format|
      if @model_element.save
        format.html { redirect_to(@model_element, :notice => 'ModelElement was successfully created.') }
        format.xml  { render :xml => @model_element, :status => :created, :location => @model_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @model_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /model_elements/1
  # PUT /model_elements/1.xml
  def update
    @model_element = ModelElement.find(params[:id])

    respond_to do |format|
      if @model_element.update_attributes(params[:model_element])
        format.html { redirect_to(@model_element, :notice => 'ModelElement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @model_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /model_elements/1
  # DELETE /model_elements/1.xml
  def destroy
    @model_element = ModelElement.find(params[:id])
    @model_element.destroy

    respond_to do |format|
      format.html { redirect_to(model_elements_url) }
      format.xml  { head :ok }
    end
  end
end
