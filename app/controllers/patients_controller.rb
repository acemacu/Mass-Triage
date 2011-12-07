# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class PatientsController < ApplicationController
  layout 'patient'
  require 'json'
  before_filter :require_user
  
  def other
    @incident_id = params[:incident_id]
    puts "ID = " + @incident_id
    date_millis = Time.at(params[:after].to_i/1000)
    puts "Time = " + date_millis.to_s
    @patients = Patient.where("incident_id = ? and updated_at > ?", @incident_id, date_millis).limit(1)
    puts "#Patients = " + @patients.count.to_s

    if (@patients.count > 0)
      @authenticity_token = params[:authenticity_token]
      puts "Authenticity token = " + @authenticity_token
      @new_patients = Patient.where("incident_id = ? and created_at > ?", @incident_id, date_millis)
      puts "New patients = " + @new_patients.count.to_s
      @triage = Patient.select("tagColor, count(*) as number").where("incident_id = ?", @incident_id).group("tagColor")
      puts "Triage = " + @triage.count.to_s
      @general = Patient.where("incident_id = ?", @incident_id)
      puts "#Total_Patients = " + @general.count.to_s
      @hospitals = Hospital.order("name");
      puts "#Hospitals = " + @hospitals.count.to_s
      @all_ambulances = Ambulance.where("incident_id = ?", @incident_id).order("idAmbulance");
      puts "#Ambulances = " + @all_ambulances.count.to_s
    end

    @ambulances = Ambulance.where("incident_id = ? and updated_at > ?", @incident_id, date_millis).limit(1)
    puts "#Ambulances = " + @ambulances.count.to_s

    if (@ambulances.count > 0)
      @ambulances_assigned = Ambulance.select("status, count(*) as number").where("incident_id = ?", @incident_id).group("status")
      puts "Amb. Assigned " + @ambulances_assigned.count.to_s
      @general_ambulances = Ambulance.where("incident_id = ?", @incident_id).order("idAmbulance");
      puts "#Ambulances = " + @general_ambulances.count.to_s
      @all_patients = Patient.where("incident_id = ?", @incident_id)
      puts "#Pacients = " + @all_patients.count.to_s
    end

    @incident = Incident.where("id = ? and updated_at > ?", @incident_id, date_millis)
    puts "#Incident = " + @incident.count.to_s

    if (@incident.count > 0)
      @incident_types = IncidentType.order("name");
      puts "#Incident types = " + @incident_types.count.to_s
    end

  end
  

  def index    
    @incident = Incident.find(params[:incident_id])
    @patients = @incident.patients.all
    @patient = @incident.patients.new
    
   @hospitals = Hospital.all
   @stringHospitals = json_hospitals(@hospitals)
   
   @incidentType = IncidentType.all
   @stringIncidentType = json_incidentType(@incidentType)
   
   @ambulances = @incident.ambulances.all
   @stringAmbulances = json_ambulance(@ambulances)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end


  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end


  def new
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.new
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end


  def edit
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.find(params[:id])
  end

  def create
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.create!(params[:patient])
    @patient.is_deleted = false;
    if(current_user.id != nil)
      @patient.creating_user_id = current_user.id
    end
    
    respond_to do |format|
        if @patient.save
           flash[:notice] = "You just added a patient!"
          format.html { redirect_to incident_patients_path }
          format.js
        else
          format.html { render :action => "index" }
          format.xml  { render :xml => @incident.errors, :status => :unprocessable_entity }
        end

      end
    end
  
  
  def update
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.find(params[:id])
    @temp_patient=@patient.clone
    
    respond_to do |format|
      if(params[:patient])
        if @patient.update_attributes(params[:patient])
             @chng = PatientUpdate.new.recordchanges(params[:patient], @incident, @patient, current_user.id )
            flash[:notice] = "Patient successfully updated."
          if params[:patient][:numberOfTag]
            @chng.updated = "Tag Number"
            @chng.previous =@temp_patient.numberOfTag
            format.html {  render :text => params[:patient][:numberOfTag] }
            format.json  { head :ok }
          elsif params[:patient][:tagColor]
            @chng.updated = "Tag Color"
            @chng.previous =@temp_patient.tagColor
            format.html {  render :text => params[:patient][:tagColor] }
            format.json  { head :ok }
          elsif params[:patient][:sex]
            @chng.updated = "Sex"
            @chng.previous =@temp_patient.sex
            format.html {  render :text => params[:patient][:sex] }
            format.json  { head :ok }
          elsif params[:patient][:age]
            @chng.updated = "Age"
            @chng.previous =@temp_patient.age
            format.html {  render :text => params[:patient][:age] }
            format.json  { head :ok }
          elsif params[:patient][:ageType]
             @chng.updated = "Age Type"
             @chng.previous =@temp_patient.ageType
            format.html {  render :text => params[:patient][:ageType] }
            format.json  { head :ok }
          elsif params[:patient][:complaint]
             @chng.updated = "Complaint"
             @chng.previous =@temp_patient.complaint
            format.html {  render :text => params[:patient][:complaint] }
            format.json  { head :ok }
          else params[:patient][:status]
            @chng.updated = "Status"
            @chng.previous =@temp_patient.status
            format.html {  render :text => params[:patient][:status] }
            format.json  { head :ok }
          end
          @chng.save

        end
       
      elsif(params[:ambulance])
        if @patient.update_attributes(:ambulance_id => params[:ambulance][:idAmbulance])
          ambulanceName = Ambulance.find(params[:ambulance][:idAmbulance])
          format.html {  render :text => ambulanceName.idAmbulance }
          format.json  { head :ok }
        end
      else  
        if @patient.update_attributes(:hospital_id => params[:hospital][:name])
             @ambulance = Ambulance.find(@patient.ambulance_id)
             if(@ambulance.idAmbulance != "Not yet defined")
                @ambulance.update_attributes(:hospital_id => params[:hospital][:name] )
             end
             @new_hospital = Hospital.find(params[:hospital][:name])
             format.html {  render :text => @new_hospital.name }
             format.json  { head :ok }
        end
      end
    end
  end


  def destroy
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.find(params[:id])
    if(@patient.update_attributes(:is_deleted => true ))
      respond_to do |format|
        format.html { redirect_to (incident_patients_url) }
        format.js
      end
    end
  end
  
# Returns a json string of the hospitals/
  def json_hospitals(hospitals)
    hashHospitals = Hash.new
    hospitals.each do |hospital|
      hashHospitals[hospital.id] = hospital.name
    end
    return hashHospitals
  end
  
  def json_incidentType(incidentType)
    hashIncidentType = Hash.new
    incidentType.each do |incidentType|
      hashIncidentType[incidentType.id] = incidentType.name
    end
    return JSON.generate(hashIncidentType)
  end
  
  def json_ambulance(ambulance)
    hashAmbulance = Hash.new
    ambulance.each do |ambulance|
      hashAmbulance[ambulance.id] = ambulance.idAmbulance
    end
    return hashAmbulance
  end
end
