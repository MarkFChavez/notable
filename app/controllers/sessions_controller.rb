class SessionsController < ApplicationController
  before_action :check_user

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_url, notice: "Signed in successfully"
    else
      redirect_to signin_url, alert: "Invalid email or password"
    end
  end

  private

  def check_user
    redirect_to dashboard_url if current_user
  end
end
