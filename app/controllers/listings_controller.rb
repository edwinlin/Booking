class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @listings = Listing.all
  end

  def show
    if session[:user_id]
      @lister = User.find(session[:user_id])
    end

    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg"]
    @random_no = rand(29)
    @random_image = @images[@random_no]
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
    @lister = User.find(session[:user_id])
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
    redirect_to user_path(@listing.user)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:user_id, :location)
  end

end
