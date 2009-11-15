class LocationMinistry < ActiveRecord::Base
  belongs_to :ministry
  belongs_to :location
end
