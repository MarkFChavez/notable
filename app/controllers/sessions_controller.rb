class SessionsController < ApplicationController
  before_action :check_user, except: [:destroy]

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

  def destroy
    session[:user_id] = nil
    redirect_to signin_url, notice: "Signed out successfully"
  end

  private

  def check_user
    redirect_to dashboard_url if current_user
  end
end
