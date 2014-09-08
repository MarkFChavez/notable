class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_url
    else
      redirect_to signin_url
    end
  end
end
