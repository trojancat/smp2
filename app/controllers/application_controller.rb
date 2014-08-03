class ApplicationController < ActionController::Base
  # Защита от CSRF атак
  protect_from_forgery with: :exception

  # Фильтры
  before_action :authenticate_user!                                       # Требуется обязательная аутентифиция
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  # Разрешенные параметры для регистрации пользователя
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role, :name, :email, :password, :password_confirmation) }
  end
end
