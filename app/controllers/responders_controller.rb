class RespondersController < ApplicationController
  # GET /responders
  # GET /responders.xml
  def index
    @responders = Responder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @responders }
    end
  end

  # GET /responders/1
  # GET /responders/1.xml
  def show
    @responder = Responder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @responder }
    end
  end

  # GET /responders/new
  # GET /responders/new.xml
  def new
    @responder = Responder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @responder }
    end
  end

  # GET /responders/1/edit
  def edit
    @responder = Responder.find(params[:id])
  end

  # POST /responders
  # POST /responders.xml
  def create
    @responder = Responder.new(params[:responder])

    respond_to do |format|
      if @responder.save
        format.html { redirect_to(@responder, :notice => 'Responder was successfully created.') }
        format.xml  { render :xml => @responder, :status => :created, :location => @responder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @responder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /responders/1
  # PUT /responders/1.xml
  def update
    @responder = Responder.find(params[:id])

    respond_to do |format|
      if @responder.update_attributes(params[:responder])
        format.html { redirect_to(@responder, :notice => 'Responder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @responder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /responders/1
  # DELETE /responders/1.xml
  def destroy
    @responder = Responder.find(params[:id])
    @responder.destroy

    respond_to do |format|
      format.html { redirect_to(responders_url) }
      format.xml  { head :ok }
    end
  end
end
