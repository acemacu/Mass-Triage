# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class UserSession < Authlogic::Session::Base
  def to_key
    new_record? ? nil : [self.send(self.class.primary_key) ]
  end
  
  def persisted?
    false
  end
end
