class Trip < ActiveRecord::Base
  belongs_to :ministry
  
  validates_presence_of :name, :description, :start_at, :stop_at,
    :ministry_id
    
  def self.find_upcoming
    self.find(:all, :conditions => ['stop_at > ?', Date.today])
  end
  
  def self.find_recent
    self.find(:all, :conditions => ['stop_at < ? and start_at > ?',
      Date.today, (Date.today - 60)])
  end
  
end
