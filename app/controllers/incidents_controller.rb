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

  # POST /incidentsrequire 'incidents_controller'
  # POST /incidents.xml
  # Patient count == to show?
  def create  
    @incident = Incident.new(params[:incident])
  
    
    respond_to do |format|
      if @incident.save
        hospital = Hospital.find(:first, :conditions => {:name => "Not yet defined"})
        puts "Hospital name " << hospital.name
        ambulance = Ambulance.create(:idAmbulance => "Not yet defined", :incident_id => @incident.id, :hospital_id => hospital.id )
        puts "Ambulance name" << ambulance.id
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
   params[:incident][:requested_amb_count] = @incident.requested_amb_count + Integer(params[:incident][:requested_amb_count])

    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        if (params[:commit] == "BEGIN TRIAGE")
          format.html {redirect_to(incident_patients_path(@incident), :notice => 'Incident was successfully updated.')}
          format.xml  { head :ok }
        else
          format.html {redirect_to(incident_ambulances_path(@incident), :notice => 'Incident was successfully updated.')}
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end 
  


  
  def resourceupdate
   @incident = Incident.find(params[:incident_id])
    
    respond_to do |format|
     
      if(params[:incident])
          if @incident.update_attributes(params[:incident])
            if params[:incident][:location]
              format.html {  render :text => params[:incident][:location] }
              format.json  { head :ok }
            elsif params[:incident][:latitude]
              format.html {  render :text => params[:incident][:latitude] }
              format.json  { head :ok }
            elsif params[:incident][:longitude]
              format.html {  render :text => params[:incident][:longitude] }
              format.json  { head :ok }
            end
          end
      elsif(params[:incident_type])
          if(@incident.update_attributes(:incident_type_id => params[:incident_type][:name]))
            incidentTypeName = IncidentType.find(params[:incident_type][:name])
            format.html {  render :text => incidentTypeName.name  }
          end
      end
    end
  end
  
  def viewupdate
    @incident = Incident.find(params[:incident_id])
   
    params[:incident][:requested_amb_count] = @incident.requested_amb_count + params[:incident][:requested_amb_count].to_i

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

end
