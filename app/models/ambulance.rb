# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class Ambulance < ActiveRecord::Base
  belongs_to :incident
  has_many :patients
  belongs_to :hospital  
end
