class SessionsController < ApplicationController
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
end
