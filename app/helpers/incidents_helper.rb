# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

module IncidentsHelper
  def added(incident)

        @join =  incident.users.find(current_user.id) if incident.users.exists?(current_user.id)
        if @join.nil?
          return false
        else
          return true
        end
  end
end
