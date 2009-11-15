class Ministry < ActiveRecord::Base
  has_many :location_ministries, :dependent => :destroy
  has_many :locations, :through => :location_ministries
  has_many :projects, :dependent => :destroy, :order => 'start_at DESC'
  has_many :trips, :dependent => :destroy, :order => 'start_at DESC'
  
  validates_presence_of :name, :description
  validates_uniqueness_of :code
end
