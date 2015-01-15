class DiagramElementsController < ApplicationController
  # GET /diagram_elements
  # GET /diagram_elements.xml
  def index
    @diagram_elements = DiagramElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @diagram_elements }
    end
  end

  # GET /diagram_elements/1
  # GET /diagram_elements/1.xml
  def show
    @diagram_element = DiagramElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diagram_element }
    end
  end

  # GET /diagram_elements/new
  # GET /diagram_elements/new.xml
  def new
    @diagram_element = DiagramElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @diagram_element }
    end
  end

  # GET /diagram_elements/1/edit
  def edit
    @diagram_element = DiagramElement.find(params[:id])
  end

  # POST /diagram_elements
  # POST /diagram_elements.xml
  def create
    @diagram_element = DiagramElement.new(params[:diagram_element])

    respond_to do |format|
      if @diagram_element.save
        format.html { redirect_to(@diagram_element, :notice => 'DiagramElement was successfully created.') }
        format.xml  { render :xml => @diagram_element, :status => :created, :location => @diagram_element }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @diagram_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /diagram_elements/1
  # PUT /diagram_elements/1.xml
  def update
    @diagram_element = DiagramElement.find(params[:id])

    respond_to do |format|
      if @diagram_element.update_attributes(params[:diagram_element])
        format.html { redirect_to(@diagram_element, :notice => 'DiagramElement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @diagram_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /diagram_elements/1
  # DELETE /diagram_elements/1.xml
  def destroy
    @diagram_element = DiagramElement.find(params[:id])
    @diagram_element.destroy

    respond_to do |format|
      format.html { redirect_to(diagram_elements_url) }
      format.xml  { head :ok }
    end
  end
end
