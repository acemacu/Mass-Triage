class PatientUpdate < ActiveRecord::Base

  belongs_to :patient

  def recordchanges(test, incident, patient, user)
    puts "record changes"
    @update = PatientUpdate.new

    @update.patient_id = patient.id
    @update.incident_id = incident.id
    test.each do |key, value|
      #@update.updated = key
      @update.value = value
    end
    @update.updateTime = Time.now()
    @update.user_id = user
    #@update.save
    return @update
  end

  def getupdates(incidentid, patientid)
    return PatientUpdate.select("*").where("incident_id=? and patient_id=? ", incidentid, patientid)
  end

  def transported(incidentid, patientid)
  return PatientUpdate.select("updateTime, value").where("incident_id=? and patient_id=? and value=?", incidentid, patientid, "Transported").last
  end
end
