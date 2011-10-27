class Incident < ActiveRecord::Base
  has_many :ambulances
  has_many :patients
    
  validates_numericality_of :est_patient_count, :only_integer => true, :allow_nil => true
  validates_numericality_of :requested_amb_count, :only_integer => true, :allow_nil => true 
  validates_numericality_of :latitude, :only_integer => false, :allow_nil => true
  validates_numericality_of :longitude, :only_integer => false, :allow_nil => true
end
