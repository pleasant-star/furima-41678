class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(auth_options)
    if resource
      set_flash_message!(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      redirect_to root_path
    else
      flash.now[:alert] = 'ログイン情報が正しくありません。'
      render :new, status: :unprocessable_entity
    end
  end
end
