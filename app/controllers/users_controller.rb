class UsersController < ApplicationController

  before_filter :require_current_user!, except: [:new, :create]
  before_filter :require_no_current_user!, only: [:new, :create]

  def require_current_user!
    unless logged_in?
      flash[:errors] = ["Must be logged-in to perform that action."]
      redirect_to new_session_url
    end
  end

  def require_no_current_user!

  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    # render :json => @user
 #    return
    if @user.save
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end
end
