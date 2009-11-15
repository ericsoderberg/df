class HomeController < ApplicationController
  def index
    @locations = Location.find(:all, :include => :ministries)
    @pages = Page.find(:all)
    @ministries = Ministry.find(:all)
    @news_trips = Trip.find_upcoming + Trip.find_recent
  end

end
