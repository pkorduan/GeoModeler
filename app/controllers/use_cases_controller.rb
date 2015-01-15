class UseCasesController < ApplicationController
  # GET /use_cases
  # GET /use_cases.xml
  def index
    @use_cases = UseCase.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @use_cases }
    end
  end

  # GET /use_cases/1
  # GET /use_cases/1.xml
  def show
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @use_case }
    end
  end

  # GET /use_cases/new
  # GET /use_cases/new.xml
  def new
    @use_case = UseCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @use_case }
    end
  end

  # GET /use_cases/1/edit
  def edit
    @use_case = UseCase.find(params[:id])
  end

  # POST /use_cases
  # POST /use_cases.xml
  def create
    @use_case = UseCase.new(params[:use_case])

    respond_to do |format|
      if @use_case.save
        format.html { redirect_to(@use_case, :notice => 'UseCase was successfully created.') }
        format.xml  { render :xml => @use_case, :status => :created, :location => @use_case }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @use_case.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /use_cases/1
  # PUT /use_cases/1.xml
  def update
    @use_case = UseCase.find(params[:id])

    respond_to do |format|
      if @use_case.update_attributes(params[:use_case])
        format.html { redirect_to(@use_case, :notice => 'UseCase was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @use_case.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /use_cases/1
  # DELETE /use_cases/1.xml
  def destroy
    @use_case = UseCase.find(params[:id])
    @use_case.destroy

    respond_to do |format|
      format.html { redirect_to(use_cases_url) }
      format.xml  { head :ok }
    end
  end
end
