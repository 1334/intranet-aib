class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, except: [:login, :index, :show]

  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user #makes this method available from the views

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end
end
