class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.authenticate(params[:name],params[:password])
    if user 
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url, notice: "User #{user.name} succesfully logged in"
    else
      flash.now.alert = "Invalid user"
      render :new
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: "Logged Out"
  end
end
