class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :current_admin?
  helper_method :admin_only

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_permission(resource)
    if current_user != resource.find(params[:id])
      not_found
    end
  end

  def not_found
    render status: 404
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def admin_only
    not_found unless current_admin?
  end

  def require_login
    redirect_to signin_path unless current_user
  end
end
