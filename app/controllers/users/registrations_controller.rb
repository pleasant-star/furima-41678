class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      sign_up(resource_name, resource)
      redirect_to root_path
    else
      clean_up_passwords(resource)
      @user = resource
      flash.now[:alert] = resource.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end
end
