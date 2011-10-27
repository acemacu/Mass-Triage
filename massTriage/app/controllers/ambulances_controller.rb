class AmbulancesController < ApplicationController
  # GET /ambulances
  # GET /ambulances.xml
  def index
    @ambulances = Ambulance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ambulances }
    end
  end

  # GET /ambulances/1
  # GET /ambulances/1.xml
  def show
    @ambulance = Ambulance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ambulance }
    end
  end

  # GET /ambulances/new
  # GET /ambulances/new.xml
  def new
    @ambulance = Ambulance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ambulance }
    end
  end

  # GET /ambulances/1/edit
  def edit
    @ambulance = Ambulance.find(params[:id])
  end

  # POST /ambulances
  # POST /ambulances.xml
  def create
    @ambulance = Ambulance.new(params[:ambulance])

    respond_to do |format|
      if @ambulance.save
        format.html { redirect_to(@ambulance, :notice => 'Ambulance was successfully created.') }
        format.xml  { render :xml => @ambulance, :status => :created, :location => @ambulance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ambulance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ambulances/1
  # PUT /ambulances/1.xml
  def update
    @ambulance = Ambulance.find(params[:id])

    respond_to do |format|
      if @ambulance.update_attributes(params[:ambulance])
        format.html { redirect_to(@ambulance, :notice => 'Ambulance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ambulance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ambulances/1
  # DELETE /ambulances/1.xml
  def destroy
    @ambulance = Ambulance.find(params[:id])
    @ambulance.destroy

    respond_to do |format|
      format.html { redirect_to(ambulances_url) }
      format.xml  { head :ok }
    end
  end
end
