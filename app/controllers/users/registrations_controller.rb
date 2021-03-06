class Users::RegistrationsController < Devise::RegistrationsController
  include Devise::Controllers::Rememberable
  before_action :configure_sign_up_parameters, if: :devise_controller?

  private

  def configure_sign_up_parameters
    added_attrs = User::USER_PARAMS_SIGNUP
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
