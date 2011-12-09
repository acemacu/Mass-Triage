# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  filter_parameter_logging :password
  helper_method :current_user
  layout :resolve_layout
 
  private
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find 
  end

  private
  def resolve_layout
    case action_name
    when "viewreport"
      "report"
    else
      "application"
    end
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end
  
end
