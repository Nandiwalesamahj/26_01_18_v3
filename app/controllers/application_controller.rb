class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cache_headers,:configure_permitted_parameters,if: :devise_controller?

  private
  def set_cache_headers
  	response.headers["Cache-Control"] = "no-cache , no-store, max-age=0,must-revalidate"
  	response.headers["Pragma"] = "no no-cache"
  	response.headers["Expires"] = "Fri,01 Jan 1990 00:00:00 GMT"
  end
 
  def configure_permitted_parameters
  added_attrs = [:first_name,:middle_name,:last_name,:phone, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
 
   def after_sign_in_path_for(resource)
  	homepage_path(current_user)  	
  end
  def after_inactive_sign_up_path_for(resource)
    edit_user_path(current_user)   
  end
end
