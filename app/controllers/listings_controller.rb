class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @listings = Listing.all
  end

  def show
    @listings = Listing.all
  end

  def lister_show
    @lister = User.find(params[:id])
  end

  def new
    @listing = Listing.new
    @user = User.find(session[:user_id])
    flash[:error] = nil
  end

  def create
    @listing = Listing.create(listing_params)
    if @listing.valid?
      session[:listing_id] = @listing.id
      redirect_to listing_path(@listing)
    else
      flash[:error] = @listing.errors.full_messages
      @listing = Listing.new
      @user = User.find(session[:user_id])
      render :new
    end
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
