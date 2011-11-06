class Ambulance < ActiveRecord::Base
  after_initialize :default_values
  belongs_to :incident
  has_many :patients
  belongs_to :hospital
  
  validates_presence_of :idAmbulance
  
  private
    def default_values
      self.idAmbulance ||= "Not defined"
    end
  
end
