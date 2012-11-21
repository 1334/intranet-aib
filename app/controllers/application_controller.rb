class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, except: [:login, :index, :show]
  before_filter :set_locale

  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user #makes this method available from the views

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
  end

  def default_url_options(options={})
      # logger.debug "default_url_options is passed options: #{options.inspect}\n"
      { :locale => I18n.locale  }
  end

end
