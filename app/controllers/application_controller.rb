class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_signed_in

  def check_signed_in
    redirect_to albums_path if signed_in? and controller_name == 'home'
  end

  protected
    def configure_permitted_parameters
      # sign_up
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:email, :password, :password_confirmation)
      end
      # sign_in
      devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        user_params.permit(:password, :email)
      end
      # Update
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:email, :password, :current_password)
      end
    end

  private
    def layout_by_resource
      if devise_controller? || controller_name=='home'
        if controller_name=='registrations' && action_name=='edit'
          "application"
        else
          "home"
        end
      else
        "application"
      end
    end
end
