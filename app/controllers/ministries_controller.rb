class MinistriesController < ApplicationController
  before_filter :administrator_required, :except => [:index, :show]
  before_filter :load_data_files, :only => [:new, :create, :edit, :update]
  
  # GET /ministries
  # GET /ministries.xml
  def index
    @ministries = Ministry.find(:all)
    @tab = "ministries"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ministries }
    end
  end

  # GET /ministries/1
  # GET /ministries/1.xml
  def show
    @ministry = Ministry.find(params[:id])
    @tab = "ministries"

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ministry }
    end
  end

  # GET /ministries/new
  # GET /ministries/new.xml
  def new
    @ministry = Ministry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ministry }
    end
  end

  # GET /ministries/1/edit
  def edit
    @ministry = Ministry.find(params[:id])
    @location_ministry = @ministry.location_ministries.new
  end

  # POST /ministries
  # POST /ministries.xml
  def create
    @ministry = Ministry.new(params[:ministry])

    respond_to do |format|
      if @ministry.save
        #flash[:notice] = 'Ministry was successfully created.'
        format.html { redirect_to(@ministry) }
        format.xml  { render :xml => @ministry, :status => :created,
          :location => @ministry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ministry.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ministries/1
  # PUT /ministries/1.xml
  def update
    @ministry = Ministry.find(params[:id])

    respond_to do |format|
      if @ministry.update_attributes(params[:ministry])
        #flash[:notice] = 'Ministry was successfully updated.'
        format.html { redirect_to(@ministry) }
        format.xml  { head :ok }
      else
        @location_ministry = @ministry.location_ministries.new
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ministry.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ministries/1
  # DELETE /ministries/1.xml
  def destroy
    @ministry = Ministry.find(params[:id])
    @ministry.destroy

    respond_to do |format|
      format.html { redirect_to(ministries_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def load_data_files
    @data_files = DataFile.find(:all, :order => :name)
  end
end
