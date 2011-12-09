# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications 

class AdministratorsController < ApplicationController
  before_filter :require_user
  
  def index
    respond_to do |format|
      format.html
    end
  end
  
end