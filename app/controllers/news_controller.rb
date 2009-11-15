class NewsController < ApplicationController

  def index
    @upcoming = Trip.find_upcoming
    @recent = Trip.find_recent
    @tab = 'news'
  end

end
