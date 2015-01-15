class StereotypesController < ApplicationController
  # GET /stereotypes
  # GET /stereotypes.xml
  def index
    @stereotypes = Stereotype.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stereotypes }
    end
  end

  # GET /stereotypes/1
  # GET /stereotypes/1.xml
  def show
    @stereotype = Stereotype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stereotype }
    end
  end

  # GET /stereotypes/new
  # GET /stereotypes/new.xml
  def new
    @stereotype = Stereotype.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stereotype }
    end
  end

  # GET /stereotypes/1/edit
  def edit
    @stereotype = Stereotype.find(params[:id])
  end

  # POST /stereotypes
  # POST /stereotypes.xml
  def create
    @stereotype = Stereotype.new(params[:stereotype])

    respond_to do |format|
      if @stereotype.save
        format.html { redirect_to(@stereotype, :notice => 'Stereotype was successfully created.') }
        format.xml  { render :xml => @stereotype, :status => :created, :location => @stereotype }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stereotype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stereotypes/1
  # PUT /stereotypes/1.xml
  def update
    @stereotype = Stereotype.find(params[:id])

    respond_to do |format|
      if @stereotype.update_attributes(params[:stereotype])
        format.html { redirect_to(@stereotype, :notice => 'Stereotype was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stereotype.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stereotypes/1
  # DELETE /stereotypes/1.xml
  def destroy
    @stereotype = Stereotype.find(params[:id])
    @stereotype.destroy

    respond_to do |format|
      format.html { redirect_to(stereotypes_url) }
      format.xml  { head :ok }
    end
  end
end
