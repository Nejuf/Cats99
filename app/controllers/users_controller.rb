class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    # render :json => @user
 #    return
    if @user.save
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
