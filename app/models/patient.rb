class Patient < ActiveRecord::Base
  belongs_to :incident
  belongs_to :hospital
  belongs_to :ambulance
end
