# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Hospital.create(:name => 'Not yet defined')

IncidentType.create(:name => 'Motor Vehicle Collision')
IncidentType.create(:name => 'HazMat')
IncidentType.create(:name => 'Collapsed Building')
IncidentType.create(:name => 'Train Collision')
IncidentType.create(:name => 'Bus Collision')
IncidentType.create(:name => 'Earthquake')
IncidentType.create(:name => 'Flood')

Hospital.create(:name =>'Stanford', :address => '300 Pasteur Drive, Stanford, CA')
Hospital.create(:name =>'Palo Alto Medical Center', :address => '795 El Camino Real, Palo Alto, CA')
Hospital.create(:name =>'Lucile Packard Children\'s Hospital', :address => '725 Welch Road, Palo Alto, CA')
Hospital.create(:name =>'VA Palo Alto Health Care System', :address => '3801 Miranda Avenue Palo Alto, CA')
Hospital.create(:name =>'Regional Medical Center of San Jose', :address => '225 North Jackson Ave San Jose, CA')
Hospital.create(:name =>'St. Mary\'s Medical Center', :address => '450 Stanyan Street, San Francisco, CA')
Hospital.create(:name =>'California Pacific Medical Center', :address => '2333 Buchanan Street, San Francisco, CA')






