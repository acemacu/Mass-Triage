class Hospital < ActiveRecord::Base
  after_initialize :default_values
  has_many :patients
  
  private
    def default_values
      self.name ||= "Not defined"
    end
end
