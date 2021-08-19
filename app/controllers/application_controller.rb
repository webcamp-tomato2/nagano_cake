class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
  case resource
    when Admin
      admin_orders_path
    when Customer
      homes_about_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when Admin
      root_path
    when Customer
      root_path
    end
  end
end
