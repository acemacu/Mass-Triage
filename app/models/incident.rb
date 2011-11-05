class Incident < ActiveRecord::Base 
  
  has_many :ambulances
  has_many :patients
  
 / validates_positive_or_zero :est_patient_count
  validates_positive_or_zero :requested_amb_count /
  validates_numericality_of :est_patient_count, :only_integer => true, :allow_nil => true, :greater_than => -1, :on => :update
  validates_numericality_of :requested_amb_count, :only_integer => true, :allow_nil => true, :greater_than => -1, :on => :update
  validates_numericality_of :latitude, :only_integer => false, :allow_nil => true
  validates_numericality_of :longitude, :only_integer => false, :allow_nil => true
  validates_presence_of :date, :on => :create, :message => "can't be blank"


  def color_dist(color)
   patients.find_all_by_tagColor(color).count
  end
  
  def amb_count(status)
    ambulances.find_all_by_status(status).count
  end
  

  
end
