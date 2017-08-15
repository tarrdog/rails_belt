class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to '/login'
    end
  end

  def logout
    session.clear
    redirect_to '/login'
  end
end
