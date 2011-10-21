class Incident < ActiveRecord::Base
  has_many :ambulances
end
