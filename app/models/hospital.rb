class Hospital < ActiveRecord::Base
  has_many :patients
end
