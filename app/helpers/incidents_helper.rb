# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

module IncidentsHelper
  def added(incident)
        if incident.users.exists?(current_user.id)
                 return true
        else
          return false
        end
  end

  def user(responderid)
    return @user = User.find(responderid)

  end


  def updates(incidentid, patientid)
   return PatientUpdate.new.getupdates(incidentid, patientid)

  end

  def transport(incidentid, patientid)
     return  PatientUpdate.new.transported(incidentid, patientid)
  end

  def incidentcommander()

  end
end
