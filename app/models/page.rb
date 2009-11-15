class Page < ActiveRecord::Base

  before_validation do |page|
    page.parameterized_name = page.name.parameterize
  end

  validates_presence_of :name, :contents
  validates_uniqueness_of :parameterized_name
  
end
