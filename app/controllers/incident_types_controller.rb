# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class IncidentTypesController < ApplicationController

  before_filter :require_user
  
  def index
    @incident_types = IncidentType.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_types }
    end
  end

  def show
    @incident_type = IncidentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident_type }
    end
  end

  def new
    @incident_type = IncidentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_type }
    end
  end

  def edit
    @incident_type = IncidentType.find(params[:id])
  end

  def create
    @incident_type = IncidentType.new(params[:incident_type])
    @incident_type.is_deleted = false;

    respond_to do |format|
      if @incident_type.save
        format.html { redirect_to(incident_types_path, :notice => 'Incident type was successfully created.') }
        format.xml  { render :xml => @incident_type, :status => :created, :location => @incident_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @incident_type = IncidentType.find(params[:id])

    respond_to do |format|
      if @incident_type.update_attributes(params[:incident_type])
        format.html { redirect_to(incident_types_path, :notice => 'Incident type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @incident_type = IncidentType.find(params[:id])
    if(@incident_type.update_attributes(:is_deleted => true ))
      respond_to do |format|
        format.html { redirect_to (incident_types_url) }
        format.xml  { head :ok }
      end
    end
  end
  
end
