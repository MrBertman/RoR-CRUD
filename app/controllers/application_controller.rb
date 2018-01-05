class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :set_locale

  def route_not_found
    render status => 500
  end

  def set_locale
    if(user_signed_in?)
      I18n.locale = current_user.locale || I18n.default_locale
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
