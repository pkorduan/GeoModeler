class AssociationEndsController < ApplicationController
  # GET /association_ends
  # GET /association_ends.xml
  def index
    @association_ends = AssociationEnd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @association_ends }
    end
  end

  # GET /association_ends/1
  # GET /association_ends/1.xml
  def show
    @association_end = AssociationEnd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @association_end }
    end
  end

  # GET /association_ends/new
  # GET /association_ends/new.xml
  def new
    @association_end = AssociationEnd.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @association_end }
    end
  end

  # GET /association_ends/1/edit
  def edit
    @association_end = AssociationEnd.find(params[:id])
  end

  # POST /association_ends
  # POST /association_ends.xml
  def create
    @association_end = AssociationEnd.new(params[:association_end])

    respond_to do |format|
      if @association_end.save
        format.html { redirect_to(@association_end, :notice => 'AssociationEnd was successfully created.') }
        format.xml  { render :xml => @association_end, :status => :created, :location => @association_end }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @association_end.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /association_ends/1
  # PUT /association_ends/1.xml
  def update
    @association_end = AssociationEnd.find(params[:id])

    respond_to do |format|
      if @association_end.update_attributes(params[:association_end])
        format.html { redirect_to(@association_end, :notice => 'AssociationEnd was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @association_end.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /association_ends/1
  # DELETE /association_ends/1.xml
  def destroy
    @association_end = AssociationEnd.find(params[:id])
    @association_end.destroy

    respond_to do |format|
      format.html { redirect_to(association_ends_url) }
      format.xml  { head :ok }
    end
  end
end
