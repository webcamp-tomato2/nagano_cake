class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_item_path
      when Customer
        homes_about_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      new_customer_session_path
    else
      root_path
    end
  end
  
  
  protected

 def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
 end

end
