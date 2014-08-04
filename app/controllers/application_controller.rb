class ApplicationController < ActionController::Base
  # Защита от CSRF атак
  protect_from_forgery with: :exception

  # Фильтры
  before_action :authenticate_user!                                       # Требуется обязательная аутентифиция
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Шаблон
  layout :layout_by_resource


  protected

  # Разрешенные параметры для учетной записи пользователя
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role, :name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  end

  # Выбираем конкреный шаблон в зависимости от текущего ресурса
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
