class PatientsController < ApplicationController
layout 'patient'
require 'json'
  
  def other
    date_millis = Time.at(params[:after].to_i/1000)
    puts "Time query = " + date_millis.to_s
    @patients = Patient.where("incident_id = ? and updated_at > ?", params[:incident_id], date_millis)
  end
  
  # GET /patients
  # GET /patients.xml
  def index
    @incident = Incident.find(params[:incident_id])
    @patients = @incident.patients.all
    @patient = @incident.patients.new
   
   @hospitals = Hospital.all
   @stringHospitals = json_hospitals(@hospitals)
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.xml
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.xml
  def new
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.find(params[:id])
  end

  def create
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.create!(params[:patient])
    flash[:notice] = "You just added a patient!"

    respond_to do |format|
        format.html { redirect_to incident_patients_path }
        format.js
    end
  end

  # PUT /patients/1
  # PUT /patients/1.xml
  def update
    @incident = Incident.find(params[:incident_id])
    #if(params[:hospital][:name])
     # params[:hospital][:name] = Integer(params[:hospital][:name])
    #end
    @patient = @incident.patients.find(params[:id])
    
    
    respond_to do |format|
      if(params[:patient])
        if @patient.update_attributes(params[:patient])
          flash[:notice] = "Patient successfully updated."
          if params[:patient][:numberOfTag]
            format.html {  render :text => params[:patient][:numberOfTag] }
            format.json  { head :ok }
          elsif params[:patient][:tagColor]
            format.html {  render :text => params[:patient][:tagColor] }
            format.json  { head :ok }
          elsif params[:patient][:sex]
            format.html {  render :text => params[:patient][:sex] }
            format.json  { head :ok } 
          elsif params[:patient][:age]
            format.html {  render :text => params[:patient][:age] }
            format.json  { head :ok }
          elsif params[:patient][:ageType]
            format.html {  render :text => params[:patient][:ageType] }
            format.json  { head :ok }
          elsif params[:patient][:complaint]
            format.html {  render :text => params[:patient][:complaint] }
            format.json  { head :ok }
          else params[:patient][:status]
            format.html {  render :text => params[:patient][:status] }
            format.json  { head :ok }      
          end
        end
      else  
        if @patient.update_attributes(:hospital_id => params[:hospital][:name])
             @new_hospital = Hospital.find(params[:hospital][:name])
             format.html {  render :text => @new_hospital.name }
             format.json  { head :ok }
        end
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.xml
  def destroy
    @incident = Incident.find(params[:incident_id])
    @patient = @incident.patients.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to (incident_patients_url) }
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
  
end
