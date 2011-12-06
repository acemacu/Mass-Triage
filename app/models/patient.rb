# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class Patient < ActiveRecord::Base
  belongs_to :incident
  belongs_to :hospital
  belongs_to :ambulance
  has_many :updates
end
