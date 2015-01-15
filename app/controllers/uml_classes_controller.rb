class UmlClassesController < ApplicationController
  # GET /uml_classes
  # GET /uml_classes.xml
  def index
    @uml_classes = UmlClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uml_classes }
    end
  end

  # GET /uml_classes/1
  # GET /uml_classes/1.xml
  def show
    @uml_class = UmlClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uml_class }
    end
  end

  # GET /uml_classes/new
  # GET /uml_classes/new.xml
  def new
    @uml_class = UmlClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uml_class }
    end
  end

  # GET /uml_classes/1/edit
  def edit
    @uml_class = UmlClass.find(params[:id])
  end

  # POST /uml_classes
  # POST /uml_classes.xml
  def create
    @uml_class = UmlClass.new(params[:uml_class])

    respond_to do |format|
      if @uml_class.save
        format.html { redirect_to(@uml_class, :notice => 'UmlClass was successfully created.') }
        format.xml  { render :xml => @uml_class, :status => :created, :location => @uml_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uml_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /uml_classes/1
  # PUT /uml_classes/1.xml
  def update
    @uml_class = UmlClass.find(params[:id])

    respond_to do |format|
      if @uml_class.update_attributes(params[:uml_class])
        format.html { redirect_to(@uml_class, :notice => 'UmlClass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uml_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uml_classes/1
  # DELETE /uml_classes/1.xml
  def destroy
    @uml_class = UmlClass.find(params[:id])
    @uml_class.destroy

    respond_to do |format|
      format.html { redirect_to(uml_classes_url) }
      format.xml  { head :ok }
    end
  end
end
