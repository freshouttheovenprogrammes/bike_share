class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user
  helper_method :current_admin?

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_permission(resource)
    if current_user != resource.find(params[:id])
      not_found
    elsif
      current_user == resource.find(params[:id])
    end
  end

  def not_found
    render status: 404
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
