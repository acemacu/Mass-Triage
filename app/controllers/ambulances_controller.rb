class AmbulancesController < ApplicationController
 layout 'patient'
 before_filter :require_user
  # GET /ambulances
  # GET /ambulances.xml
  
  def index
    
    @incident = Incident.find(params[:incident_id])
    @patients = @incident.patients.all
    @ambulance = @incident.ambulances.new
    @ambulances = @incident.ambulances.all  #Craig has: @ambulances = @incident.ambulances
    
     @hospitals = Hospital.all
     @stringHospitals = json_hospitals(@hospitals)
     
    @incidentType = IncidentType.all
    @stringIncidentType = json_hospitals(@incidentType)

    @oddOrEven = 0
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ambulances }
    end
  end

  # GET /ambulances/1
  # GET /ambulances/1.xml
  def show
    @ambulance = Ambulance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ambulance }
    end
  end

  # GET /ambulances/new
  # GET /ambulances/new.xml
  def new
    @incident = Incident.find(params[:incident_id])
    @ambulance = @incident.ambulances.new
    @patients = @incident.patients.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ambulance }
    end
  end

  # GET /ambulances/1/edit
  def edit
    @incident = Incident.find(params[:incident_id])
    @ambulance = @incident.ambulances.find(params[:id])
    @patients = @incident.patients.all
  end

  # POST /ambulances
  # POST /ambulances.xml
  def create
    @incident = Incident.find(params[:incident_id])
    @ambulance = @incident.ambulances.new(params[:ambulance])
    @ambulance.adding_user_id = current_user.id

    if(@ambulance.eta < Time.now())
      @ambulance.eta = @ambulance.eta + 1.day
    end
    
    respond_to do |format|
      if @ambulance.save
        format.html { redirect_to(incident_ambulances_path, :notice => 'Ambulance was successfully created.') }
        format.xml  { render :xml => @ambulance, :status => :created, :location => @ambulance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ambulance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ambulances/1
  # PUT /ambulances/1.xml
  #Craig doesn't have all the if's after if @ambulance.update_attributes(params[:ambulance])
  def update
    @incident = Incident.find(params[:incident_id])
    @ambulance = @incident.ambulances.find(params[:id])
    
    respond_to do |format|
      if(params[:ambulance])
        if(@ambulance.eta < Time.now())
          @ambulance.eta = @ambulance.eta + 1.day
        end
        
        if @ambulance.update_attributes(params[:ambulance])
          flash[:notice] = "Ambulance successfully updated."
          if params[:ambulance][:idAmbulance]
            format.html {  render :text => params[:ambulance][:idAmbulance] }
            format.json  { head :ok }
          elsif params[:ambulance][:status]
            format.html {  render :text => params[:ambulance][:status] }
            format.json  { head :ok }
          elsif params[:ambulance][:hospital]
            format.html {  render :text => params[:ambulance][:hospital] }
            format.json  { head :ok }
          elsif params[:ambulance][:eta]
            format.html {  render :text => params[:ambulance][:eta] }
            format.json  { head :ok }
          end
        end
      else  
        if @ambulance.update_attributes(:hospital_id => params[:hospital][:name])
          @new_hospital = Hospital.find(params[:hospital][:name])
          format.html {  render :text => @new_hospital.name }
          format.json  { head :ok }
        end
      end
    end
  end

  # DELETE /ambulances/1
  # DELETE /ambulances/1.xml
  def destroy
    @incident = Incident.find(params[:incident_id])
    @ambulance = @incident.ambulances.find(params[:id])
    if(@ambulance.idAmbulance != "Not yet defined")
      @ambulance.destroy
    end

    respond_to do |format|
      format.html { redirect_to(incident_ambulances_url) }
      format.js
    end
  end
  
  /Returns a json string of the hospitals/
  def json_hospitals(hospitals)
    hashHospitals = Hash.new
    hospitals.each do |hospital|
      hashHospitals[hospital.id] = hospital.name
    end
    return JSON.generate(hashHospitals)
  end
  
  def json_incidentType(incidentType)
    hashIncidentType = Hash.new
    incidentType.each do |incidentType|
      hashIncidentType[incidentType.id] = incidentType.name
    end
    return JSON.generate(hashIncidentType)
  end
  
end
