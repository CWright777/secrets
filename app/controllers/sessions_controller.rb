class SessionsController < ApplicationController
  def new
    @session = User.new
  end
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:danger] = 'Invalid email/password combo'
      redirect_to '/sessions/new'
    end
  end
  def destroy
    reset_session
    redirect_to '/sessions/new'
  end
end
