class Project < ActiveRecord::Base
  belongs_to :ministry
  has_many :donations
  
  validates_presence_of :name, :description, :ministry_id
  validates_uniqueness_of :code
end
