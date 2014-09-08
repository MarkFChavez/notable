class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id])

  rescue ActiveRecord::RecordNotFound
    nil
  end
  helper_method :current_user

  private

  def authenticate_user
    redirect_to signin_url unless current_user
  end
end
