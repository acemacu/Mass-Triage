class IncidentsController < ApplicationController
  # GET /incidents
  # GET /incidents.xml
  def index
    @incidents = Incident.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incidents }
    end
  end

  # GET /incidents/1
  # GET /incidents/1.xml
  def show
    @incident = Incident.find(params[:id])
       
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident }
    end
  end

  # GET /incidents/new
  # GET /incidents/new.xml
  def new
    @incident = Incident.new
    @incident.date = Time.now()
    @incident_type = IncidentType.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident }
    end
  end

  # GET /incidents/1/edit
  def edit
    @incident = Incident.find(params[:id])
  end

  # POST /incidents
  # POST /incidents.xml
  def create
    @incident = Incident.new(params[:incident])
    
    respond_to do |format|
      if @incident.save
        format.html { redirect_to(patient_count_path(@incident), :notice => 'Incident was successfully created.') }
        format.xml  { render :xml => @incident, :status => :created, :location => @incident }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incidents/1
  # PUT /incidents/1.xml
  def update
    @incident = Incident.find(params[:id])
    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html {redirect_to(incident_patients_path(@incident), :notice => 'Incident was successfully updated.')}
          
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end

  def viewupdate
    @incident = Incident.find(params[:incident_id])
    params[:incident][:requested_amb_count] = @incident.requested_amb_count + Integer(params[:incident][:requested_amb_count])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html {redirect_to(incident_ambulances_path(@incident), :notice => 'Incident was successfully updated.')}
          
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end
  # DELETE /incidents/1
  # DELETE /incidents/1.xml
  def destroy
    @incident = Incident.find(params[:id])
    @incident.destroy

    respond_to do |format|
      format.html { redirect_to(incidents_url) }
      format.xml  { head :ok }
    end
  end
  
  def patient_count
    @incident = Incident.find(params[:incident_id])
  end

  def add_arrival

    @incident = Incident.find(params[:id])
    @incident.arrivalTime = Time.now()

    @incident.save

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html {redirect_to(incidents_path, :notice => 'Incident arrival was successfully updated.')}

        format.xml  { head :ok }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end

  end
end
