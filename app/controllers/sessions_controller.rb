class SessionsController < ApplicationController

  def index
    @sessions = Session.find_by_user_id(@current_user.id)
    render :index
  end

  def new
    render :new
    #render :text => request.env
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    p "Going to log in now"
    if @user
      p "Logging in"
      login_user!(@user)
      redirect_to cats_url
    else
      p "Error"
      flash[:errors] = ["Invalid username/password combination!"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
