class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @listings = Listing.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @listing = Listing.new
    @user = User.find(session[:user_id])
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to new_listing_path unless @listing.valid?
    session[:listing_id] = @listing.id
    redirect_to listing_path(@listing)
  end

  def edit
    flash[:error] = nil
  end

  def update
    @listing.update(listing_params)
    if @listing.valid?
      redirect_to listing_path(@listing)
    else
      flash[:error] = @listing.errors.full_messages
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to welcome_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :location, :reserved?, :start_date, :end_date)
  end

end
