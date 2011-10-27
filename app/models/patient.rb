class Patient < ActiveRecord::Base
  belongs_to :incident
end
