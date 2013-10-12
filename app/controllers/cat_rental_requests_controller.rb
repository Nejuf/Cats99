class CatRentalRequestsController < ApplicationController
  before_filter :current_user_owner_of_cat?, :only => [:approve!, :deny!]

  def index
    @catrentalrequests = CatRentalRequest.all
    render :index
  end

  def new
   #@catrentalrequest = CatRentalRequest.new
    @cats = Cat.all
    # if @catrentalrequest.persisted?
#       @catrentalrequest = CatRentalRequest.find(params[:id])
#       render :edit
#     else
    render :new
    # end
  end

  def create
    @cat_rental_requests = CatRentalRequest.new(params[:cat_rental_requests])
    if @cat_rental_requests.save!
      redirect_to cat_rental_requests_url
    else
      render :new
    end
  end

  def edit
    @cat_rental_requests = CatRentalRequest.find(params[:id])
    render :edit if @cat_rental_requests.persisted?
  end

  def update
    @cat_rental_requests = CatRentalRequest.find(params[:id])
    @cat_rental_requests.update_attributes!(params[:catrentalrequest])
    redirect_to catrentalrequests_url
  end

  def approve!
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
  end

  def deny!
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
  end

end
