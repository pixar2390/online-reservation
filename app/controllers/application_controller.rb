class ApplicationController < ActionController::Base
  #CSRF対策
  protect_from_forgery with: :exception
  #ユーザーの名前を登録できるようする
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
