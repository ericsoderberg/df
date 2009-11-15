class DataFilesController < ApplicationController
  before_filter :administrator_required
  
  # GET /data_files
  # GET /data_files.xml
  def index
    @data_files = DataFile.find(:all, :order => :name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @data_files }
    end
  end

  # POST /data_files
  # POST /data_files.xml
  def create
    @data_file = DataFile.build_and_store(params[:upload][:datafile])
    @data_file.user = self.current_user

    respond_to do |format|
      if @data_file.save
        flash[:notice] = 'File was successfully uploaded.'
        format.html { redirect_to(data_files_path) }
        format.xml  { render :xml => @data_file, :status => :created, :location => @data_file }
      else
        flash[:notice] = @data_file.errors.full_messages.join(', ')
        format.html { redirect_to(data_files_path) }
        format.xml  { render :xml => @data_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /data_files/1
  # DELETE /data_files/1.xml
  def destroy
    @data_file = DataFile.find(params[:id])
    @data_file.destroy

    respond_to do |format|
      format.html { redirect_to(data_files_path) }
      format.xml  { head :ok }
    end
  end
end
