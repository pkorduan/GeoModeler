class ClassGeneralizationsController < ApplicationController
  # GET /class_generalizations
  # GET /class_generalizations.xml
  def index
    @class_generalizations = ClassGeneralization.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @class_generalizations }
    end
  end

  # GET /class_generalizations/1
  # GET /class_generalizations/1.xml
  def show
    @class_generalization = ClassGeneralization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @class_generalization }
    end
  end

  # GET /class_generalizations/new
  # GET /class_generalizations/new.xml
  def new
    @class_generalization = ClassGeneralization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @class_generalization }
    end
  end

  # GET /class_generalizations/1/edit
  def edit
    @class_generalization = ClassGeneralization.find(params[:id])
  end

  # POST /class_generalizations
  # POST /class_generalizations.xml
  def create
    @class_generalization = ClassGeneralization.new(params[:class_generalization])

    respond_to do |format|
      if @class_generalization.save
        format.html { redirect_to(@class_generalization, :notice => 'ClassGeneralization was successfully created.') }
        format.xml  { render :xml => @class_generalization, :status => :created, :location => @class_generalization }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @class_generalization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /class_generalizations/1
  # PUT /class_generalizations/1.xml
  def update
    @class_generalization = ClassGeneralization.find(params[:id])

    respond_to do |format|
      if @class_generalization.update_attributes(params[:class_generalization])
        format.html { redirect_to(@class_generalization, :notice => 'ClassGeneralization was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @class_generalization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /class_generalizations/1
  # DELETE /class_generalizations/1.xml
  def destroy
    @class_generalization = ClassGeneralization.find(params[:id])
    @class_generalization.destroy

    respond_to do |format|
      format.html { redirect_to(class_generalizations_url) }
      format.xml  { head :ok }
    end
  end
end
