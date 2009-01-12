# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :get_app_info
  helper_method :admin?
  
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c132ccba0e489740b5c45864875bc989'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  def get_app_info
    @site_name = APP_CONFIG['site_name']
    @site_address = APP_CONFIG['site_address']
    @site_description = APP_CONFIG['site_description']

    @author = APP_CONFIG['author']
    @author_link = APP_CONFIG['author_link']
    
    @password = APP_CONFIG['password']
  end

  protected
  
  def admin?
    if session[:password] == @password
      true
    else
      false
    end
  end
  
end
