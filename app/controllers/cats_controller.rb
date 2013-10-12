class CatsController < ApplicationController

  before_filter :current_user_logged_in?, :only => [:new, :create, :edit, :update]
  before_filter :current_user_owner_of_cat?, :only => [:edit, :update]

  def current_user_logged_in?
    unless logged_in?
      flash[:errors] = ["You must be logged in for that action."]
      redirect_to new_session_url
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def new
    @cat = Cat.new
    if @cat.persisted?
      @cat = Cat.find(params[:id])
      render :edit
    else
      render :new
    end
  end

  def create
    @cat = Cat.new(params[:cat])
    @cat.owner_id = @current_user.id
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit if @cat.persisted?
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes!(params[:cat])
    redirect_to cats_url
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end
end
