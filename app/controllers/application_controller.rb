class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cache_headers
  private
  def set_cache_headers
  	response.headers["Cache-Control"] = "no-cache , no-store, max-age=0,must-revalidate"
  	response.headers["Pragma"] = "no no-cache"
  	response.headers["Expires"] = "Fri,01 Jan 1990 00:00:00 GMT"
  end
 
 
   def after_sign_in_path_for(resource)
  	homepage_path(current_user)  	
  end
end
