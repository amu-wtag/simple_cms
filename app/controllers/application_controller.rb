class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Dynamically switch locales
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Optionally, include locale in URL helpers (e.g., for links)
  def default_url_options
    { locale: I18n.locale }
  end

  private

  def confirm_logged_in
    return if session[:user_id]

    flash[:notice] = 'Please log in.'
    redirect_to access_login_path
  end
end
