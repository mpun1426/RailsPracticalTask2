class ApplicationController < ActionController::Base
  before_action :search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def search
    @q = Room.ransack(params[:q])
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :introduction, :avatar])
  end
end
