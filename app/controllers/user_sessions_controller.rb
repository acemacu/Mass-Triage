# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
        if User.find(current_user.id).role_id == 3
          format.html { redirect_to(administrators_path, :notice => 'Login Successful') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
        else
          format.html { redirect_to(:incidents, :notice => 'Login Successful') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully Logged Out"
    respond_to do |format|
      format.html { redirect_to(:login) }
      format.xml  { head :ok }
    end
  end
  
end
