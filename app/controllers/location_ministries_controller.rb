class LocationMinistriesController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :get_ministry
  
  # GET /location_ministries
  # GET /location_ministries.xml
  def index
    @ministries = Ministry.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ministries }
    end
  end

  # GET /location_ministries/1
  # GET /location_ministries/1.xml
  def show
    @ministry = Ministry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ministry }
    end
  end

  # GET /location_ministries/new
  # GET /location_ministries/new.xml
  def new
    @ministry = Ministry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ministry }
    end
  end

  # GET /location_ministries/1/edit
  def edit
    @ministry = Ministry.find(params[:id])
  end

  # POST /location_ministries
  # POST /location_ministries.xml
  def create
    delete_keys = params.keys.select{|k| k =~ /^delete-/}
    direction = 'created'
    if delete_keys.empty?
      locations = Location.find_near(params[:x], params[:y])
      @location = locations.empty? ?
        Location.create(:x => params[:x], :y => params[:y]) :
        locations.first
      @ministry.locations << @location
    else
      logger.info delete_keys.first
      delete, x, y = delete_keys.first.split('-')
      logger.info "X: #{x}, Y: #{y}"
      locations = Location.find_near(x, y)
      locations.each{|l| @ministry.locations.delete(l)}
      direction = 'deleted'
    end

    respond_to do |format|
      if @ministry.save
        flash[:notice] = "Ministry location was successfully #{direction}."
        format.html { redirect_to(edit_ministry_path(@ministry)) }
        format.xml  { render :xml => @ministry, :status => :created, :location => @ministry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ministry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /location_ministries/1
  # PUT /location_ministries/1.xml
  def update
    @ministry = Ministry.find(params[:id])

    respond_to do |format|
      if @ministry.update_attributes(params[:ministry])
        flash[:notice] = 'Ministry was successfully updated.'
        format.html { redirect_to(@ministry) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ministry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /location_ministries/1
  # DELETE /location_ministries/1.xml
  def destroy
    @ministry_location = @ministry.ministry_locations.find(params[:id])
    @ministry_location.destroy

    respond_to do |format|
      format.html { redirect_to(ministry_path(@ministry)) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def get_ministry
    @ministry = Ministry.find(params[:ministry_id])
  end
end
