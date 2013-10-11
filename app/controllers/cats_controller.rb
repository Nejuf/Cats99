class CatsController < ApplicationController

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
