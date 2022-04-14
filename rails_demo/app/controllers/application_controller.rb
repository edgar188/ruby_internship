class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :notfound
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
      :role,
      :first_name,
      :last_name,
      :email,
      :password
      )
    }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(
      :role, 
      :first_name, 
      :last_name, 
      :email, 
      :gender, 
      :birth_date, 
      :country, 
      :phone, 
      :avatar, 
      :password, 
      :current_password
      )
    }

  end

  private

  def notfound
    render file: 'public/404.html', status: :not_found, layout: false
  end

end
