class TripsController < ApplicationController
  before_filter :administrator_required, :except => [:index, :show]
  
  # GET /trips
  # GET /trips.xml
  def index
    @trips = Trip.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.xml
  def show
    @trip = Trip.find(params[:id])
    @ministry = @trip.ministry
    @tab = 'ministries'

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.xml
  def new
    @ministry = Ministry.find(params[:ministry])
    @trip = @ministry.trips.build
    @data_files = DataFile.find(:all, :order => :name)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @ministry = @trip.ministry
    @data_files = DataFile.find(:all, :order => :name)
  end

  # POST /trips
  # POST /trips.xml
  def create
    @ministry = Ministry.find(params[:ministry])
    @trip = @ministry.trips.build(params[:trip])

    respond_to do |format|
      if @trip.save
        #flash[:notice] = 'Trip was successfully created.'
        format.html { redirect_to(@trip) }
        format.xml  { render :xml => @trip, :status => :created,
          :location => @trip }
      else
        @data_files = DataFile.find(:all, :order => :name)
        format.html { render :action => "new" }
        format.xml  { render :xml => @trip.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.xml
  def update
    @trip = Trip.find(params[:id])
    @ministry = @trip.ministry

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        #flash[:notice] = 'Trip was successfully updated.'
        format.html { redirect_to(@trip) }
        format.xml  { head :ok }
      else
        @data_files = DataFile.find(:all, :order => :name)
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trip.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.xml
  def destroy
    @trip = Trip.find(params[:id])
    @ministry = @trip.ministry
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to(@ministry) }
      format.xml  { head :ok }
    end
  end
end
