class Location < ActiveRecord::Base
  has_many :location_ministries, :dependent => :destroy
  has_many :ministries, :through => :location_ministries
  
  def self.find_near(x, y)
    sql = "select * from locations where " +
      "(x - 15) < #{x} and (x + 15) > #{x} and " +
      "(y - 15) < #{y} and (y + 15) > #{y}"
    Location.find_by_sql(sql)
  end
end
