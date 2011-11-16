class Incident < ActiveRecord::Base 
  
  has_many :ambulances
  has_many :patients
  
  

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
  
  def untransported(status)
    if patients.find_all_by_status(status).count == 0
      return "There are no untransported patients listed at the incident"
    elsif patients.find_all_by_status(status).count == 1
      return "There is currently 1 untransported patient listed at the incident"
    else
      return "There are currently " << patients.find_all_by_status(status).count.to_s() << " untransported patients listed at the incident"
    end
       
  end
  

  
end
