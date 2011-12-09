# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class User < ActiveRecord::Base
  acts_as_authentic
  has_and_belongs_to_many :incidents
end
