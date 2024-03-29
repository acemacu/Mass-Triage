# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class Incident < ActiveRecord::Base 
  
  has_many :ambulances
  has_many :patients
  has_and_belongs_to_many :users
  
  validates_numericality_of :est_patient_count, :only_integer => true, :allow_nil => true, :greater_than => -1, :on => :update
  validates_numericality_of :requested_amb_count, :only_integer => true, :allow_nil => true, :greater_than => -1, :on => :update
  validates_numericality_of :latitude, :only_integer => false, :allow_nil => true
  validates_numericality_of :longitude, :only_integer => false, :allow_nil => true
  validates_presence_of :date, :on => :create, :message => "can't be blank"

  def color_dist(color, id)
   patients_untrasported = Patient.find :all, :conditions => ['tagColor = ? AND is_deleted = ? AND incident_id = ?', color, false, id]
   patients_untrasported.count
  end
  
  def amb_count(status, id)
    ambulances_count = Ambulance.find :all, :conditions => ['status = ? AND is_deleted is not ? AND incident_id = ?', status, true, id]
    return ambulances_count.count
  end
  
  def total_ambulances(id)
     total_ambulances = Ambulance.find :all, :conditions => ['is_deleted is not ? AND incident_id = ?', true, id]
     return total_ambulances.count
  end
  
  def untransported(status, id)
    patients_untrasported = Patient.find :all, :conditions => ['status = ? AND is_deleted = ? AND incident_id = ?', status, false, id]
    if patients_untrasported.count.to_s == 0
      return "There are no untransported patients listed at the incident"
    elsif patients_untrasported.count.to_s == 1
      return "There is currently 1 untransported patient listed at the incident"
    else
      return "There are currently " << patients_untrasported.count.to_s << " untransported patients listed at the incident"
    end
  end
  
  def count_patient(id)
    patients_tagged = Patient.find :all, :conditions => ['is_deleted = ? AND incident_id = ?', false, id]
    return patients_tagged
  end

end
