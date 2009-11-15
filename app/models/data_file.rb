class DataFile < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_uniqueness_of :name
  
  after_destroy :unstore
  
  DIRECTORY = 'public/files'
  
  def path
    File.join(DIRECTORY, name)
  end
  
  def url
    File.join('/files', name)
  end
  
  def self.build_and_store(file)
    data_file = DataFile.new(:name => file.original_filename)
    File.open(data_file.path, "wb") { |f| f.write(file.read) }
    data_file
  end
  
  def unstore
    begin
      File.unlink(path)
    rescue Errno::ENOENT
      # ignore errors
    end
  end
  
end
