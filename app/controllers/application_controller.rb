# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '4ec710f2fd2a33287e0664aedef5da0d'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def login_required
    redirect_to login_url unless self.current_user
  end
  
  def administrator_required
    redirect_to login_url unless admin?
  end
  
  def admin?
    self.current_user != nil and self.current_user.administrator?
  end
  
  before_filter :load_for_header
  before_filter :store_location
  
  private
  
  def load_for_header
    @ministries = Ministry.find(:all)
  end
end
