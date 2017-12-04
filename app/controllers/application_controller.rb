class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    if(current_user != nil)
      I18n.locale = current_user.locale || I18n.default_locale
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end
end
