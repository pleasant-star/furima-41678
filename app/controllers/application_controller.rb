class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mendy' && password == '0513'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :emil, :encrypted_password, :last_name, :first_name, :last_name_kana,
                                             :first_name_kana, :birthday])
  end
end
