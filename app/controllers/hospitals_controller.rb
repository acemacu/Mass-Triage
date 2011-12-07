# For more information on the technology stack selected, please refer to the document "Technology feasibility analysis"
# Developed by: Carnegie Mellon University - Team Triage
# Copyright:    Field Applications

class HospitalsController < ApplicationController
  before_filter :require_user
  
  def index
    @hospitals = Hospital.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hospitals }
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hospital }
    end
  end

  def new
    @hospital = Hospital.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hospital }
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def create
    @hospital = Hospital.new(params[:hospital])

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to(hospitals_path, :notice => 'Hospital was successfully created.') }
        format.xml  { render :xml => @hospital, :status => :created, :location => @hospital }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hospital.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      if @hospital.update_attributes(params[:hospital])
        format.html { redirect_to(hospitals_path, :notice => 'Hospital was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hospital.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    if(@hospital.name != "Not yet defined")
      @hospital.destroy
    end

    respond_to do |format|
      format.html { redirect_to(hospitals_url) }
      format.xml  { head :ok }
    end
  end
end
