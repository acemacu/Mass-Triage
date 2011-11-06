class IncidentTypesController < ApplicationController
  # GET /incident_types
  # GET /incident_types.xml
  def index
    @incident_types = IncidentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_types }
    end
  end

  # GET /incident_types/1
  # GET /incident_types/1.xml
  def show
    @incident_type = IncidentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident_type }
    end
  end

  # GET /incident_types/new
  # GET /incident_types/new.xml
  def new
    @incident_type = IncidentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_type }
    end
  end

  # GET /incident_types/1/edit
  def edit
    @incident_type = IncidentType.find(params[:id])
  end

  # POST /incident_types
  # POST /incident_types.xml
  def create
    @incident_type = IncidentType.new(params[:incident_type])

    respond_to do |format|
      if @incident_type.save
        format.html { redirect_to(@incident_type, :notice => 'Incident type was successfully created.') }
        format.xml  { render :xml => @incident_type, :status => :created, :location => @incident_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incident_types/1
  # PUT /incident_types/1.xml
  def update
    @incident_type = IncidentType.find(params[:id])

    respond_to do |format|
      if @incident_type.update_attributes(params[:incident_type])
        format.html { redirect_to(@incident_type, :notice => 'Incident type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_types/1
  # DELETE /incident_types/1.xml
  def destroy
    @incident_type = IncidentType.find(params[:id])
    @incident_type.destroy

    respond_to do |format|
      format.html { redirect_to(incident_types_url) }
      format.xml  { head :ok }
    end
  end
end
