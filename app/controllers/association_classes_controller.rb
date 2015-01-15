class AssociationClassesController < ApplicationController
  # GET /association_classes
  # GET /association_classes.xml
  def index
    @association_classes = AssociationClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @association_classes }
    end
  end

  # GET /association_classes/1
  # GET /association_classes/1.xml
  def show
    @association_class = AssociationClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @association_class }
    end
  end

  # GET /association_classes/new
  # GET /association_classes/new.xml
  def new
    @association_class = AssociationClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @association_class }
    end
  end

  # GET /association_classes/1/edit
  def edit
    @association_class = AssociationClass.find(params[:id])
  end

  # POST /association_classes
  # POST /association_classes.xml
  def create
    @association_class = AssociationClass.new(params[:association_class])

    respond_to do |format|
      if @association_class.save
        format.html { redirect_to(@association_class, :notice => 'AssociationClass was successfully created.') }
        format.xml  { render :xml => @association_class, :status => :created, :location => @association_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @association_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /association_classes/1
  # PUT /association_classes/1.xml
  def update
    @association_class = AssociationClass.find(params[:id])

    respond_to do |format|
      if @association_class.update_attributes(params[:association_class])
        format.html { redirect_to(@association_class, :notice => 'AssociationClass was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @association_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /association_classes/1
  # DELETE /association_classes/1.xml
  def destroy
    @association_class = AssociationClass.find(params[:id])
    @association_class.destroy

    respond_to do |format|
      format.html { redirect_to(association_classes_url) }
      format.xml  { head :ok }
    end
  end
end
