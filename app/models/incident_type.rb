# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class IncidentType < ActiveRecord::Base
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
end
