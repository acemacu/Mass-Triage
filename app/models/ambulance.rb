class Ambulance < ActiveRecord::Base
  belongs_to :incident
  has_many :patients
  belongs_to :hospital
end
