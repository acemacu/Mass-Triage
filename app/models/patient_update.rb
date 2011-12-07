class PatientUpdate < ActiveRecord::Base

  belongs_to :patient

  def patientchanges(current, incident, patient, user)
    @update = recordchanges(incident, patient, user)
    current.each do |key, value|
      @update.value = value
    end
    return @update
  end

  def ambchanges(current, incident, patient, user)
    @update = recordchanges(incident, patient, user)
    @update.updated = "Ambulance"
    @update.value = Ambulance.find(current).idAmbulance
    return @update
  end

  def hospitalchanges(current, incident, patient, user)
    @update = recordchanges(incident, patient, user)
    @update.updated = "Hospital"
    @update.value = Hospital.find(current).name
    return @update
  end

  def recordchanges(incident, patient, user)
    @temp = PatientUpdate.new
    @temp.patient_id = patient.id
    @temp.incident_id = incident.id
    @temp.updateTime = Time.now()
    @temp.user_id = user
    return @temp
  end

  def getupdates(incidentid, patientid)
    return PatientUpdate.select("*").where("incident_id=? and patient_id=? and previous!= value ", incidentid, patientid)
  end

  def transported(incidentid, patientid)

    return PatientUpdate.select("updateTime, value").where("incident_id=? and patient_id=? and value=? ", incidentid, patientid, "Transported").last
  end
end
