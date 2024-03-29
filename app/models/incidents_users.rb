# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class IncidentsUsers < ActiveRecord::Base
   
   def self.up
     create_table :incidents_users, :id => false do |t|
       t.integer :incident_id
       t.integer :user_id
       t.timestamps
     end
   end

   def self.down
     drop_table :incidents_users
   end
   
end
