# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class IncidentsController < ApplicationController
  before_filter :require_user
  helper :incidents
  
  def index
    if(@current_user.role_id == 3)
      @incidents = Incident.all
    else
      @incidents = Incident.find_all_by_status(true)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incidents }
    end
  end

  def show
    @incident = Incident.find(params[:id])
       
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident }
    end
  end

  def new
    @incident = Incident.new
    @incident.date = Time.now()
    @incident_type = IncidentType.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident }
    end
  end

  def edit
    @incident = Incident.find(params[:id])
  end


  def create  
    @incident = Incident.new(params[:incident])
    puts "Incident location " << @incident.location
    if(current_user != nil)
      @incident.creating_user_id = current_user.id
      @user = User.find(current_user.id)
      if @user.role_id != 3
        @incident.users.push(@user)
      end
    end
    if(params[:incident][:location] == "")
      @incident.location = 'No location specified'
    end
    if (params[:incident][:latitude] == "")
      @incident.latitude = 0
    end
    if(params[:incident][:longitude] == "")
       @incident.longitude = 0
    end
      
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

  def update
     @incident = Incident.find(params[:id])
   if ((params[:incident][:requested_amb_count].to_i) < 0)
      params[:incident][:requested_amb_count] = 0
   end
    if ((params[:incident][:est_patient_count].to_i) < 0)
      params[:incident][:est_patient_count] = 0
    end
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
        if(params[:commit] == "BEGIN TRIAGE")
          format.html { render :action => "patient_count" }
          format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
        end
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
            elsif params[:incident][:description]
              format.html {  render :text => params[:incident][:description] }
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
    
    if ((@incident.requested_amb_count + params[:incident][:requested_amb_count].to_i) < 0)
      params[:incident][:requested_amb_count] = 0
    else
      params[:incident][:requested_amb_count] = @incident.requested_amb_count + params[:incident][:requested_amb_count].to_i
    end
    
    respond_to do |format|
      if @incident.update_attributes(params[:incident])
        format.html {redirect_to(incident_ambulances_path(@incident), :notice => 'Incident was successfully updated.')}
          
        format.xml  { head :ok }
      else
        format.html { redirect_to incident_ambulances_path }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end
  

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
  
  def close
    @incident = Incident.find(params[:id])
    @patients = @incident.patients.all
    
    @hospitals = Hospital.all
   
    @incidentType = IncidentType.all
    @stringIncidentType = json_incidentType(@incidentType)
   
    @ambulances = @incident.ambulances.all
end
  
  def closeincident
    @incident = Incident.find(params[:id])
    @incident.status = false
    @incident.closing_user_id = current_user.id
  
    respond_to do |format|
      if @incident.save
        format.html {redirect_to(incidents_path, :notice => 'Incident was successfully closed.')}
        format.xml  { head :ok }
      else
        format.html { redirect_to close_incident_path }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    def json_incidentType(incidentType)
    hashIncidentType = Hash.new
    incidentType.each do |incidentType|
      hashIncidentType[incidentType.id] = incidentType.name
    end
    return JSON.generate(hashIncidentType)
  end

  def join_incident
    @incident = Incident.find(params[:id])
    @user = User.find(current_user.id)
    @incident.users.push(@user)

    respond_to do |format|
      if @incident.save
        format.html {redirect_to(incident_patients_path(params[:id]), :notice => 'You have successfully joined incident.')}
        format.xml  { head :ok }
      else
        format.html { redirect_to incidents_path }
        format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }

      end
    end

  end

  def report
    @incident = Incident.select("*").where("status = ?", false)

  end

   def viewreport
      @incident = Incident.find_by_id_and_status(params[:id], "f")
      if !@incident.nil?
        @patient =@incident.patients.all
        @incident_user = @incident.users.all

      end
   end
end



