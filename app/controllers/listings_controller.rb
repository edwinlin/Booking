class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @listings = Listing.all

    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg", "32.jpeg"]
    @random_no = rand(29)
    @random_no_1 = rand(29)
    @random_no_2 = rand(29)
    @random_no_3 = rand(29)
    @random_no_4 = rand(29)
    @random_no_5 = rand(29)
    @random_image = @images[@random_no]
    @random_image_1 = @images[@random_no_1]
    @random_image_2 = @images[@random_no_2]
    @random_image_3 = @images[@random_no_3]
    @random_image_4 = @images[@random_no_4]
    @random_image_5 = @images[@random_no_5]
  end

  def show
    if session[:user_id]
      @lister = User.find(session[:user_id])
    end

    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg", "32.jpeg"]
    @random_no = rand(29)
    @random_image = @images[@random_no]
  end

  def lister_show
    @lister = User.find(params[:id])
    @images  = ["ppl-1.jpeg", "ppl-2.jpeg", "ppl-3.jpeg", "ppl-4.jpeg", "ppl-5.jpeg", "ppl-6.jpeg", "ppl-7.jpeg", "ppl-8.jpeg", "ppl-9.jpeg", "ppl-10.jpeg", "ppl-11.jpeg", "ppl-13.jpeg", "ppl-14.jpeg", "ppl-15.jpeg", "ppl-16.jpeg", "ppl-17.jpeg", "ppl-18.jpeg", "ppl-19.jpeg", "ppl-20.jpeg", "ppl-21.jpeg", "ppl-22.jpeg", "ppl-23.jpeg", "ppl-24.jpeg", "ppl-25.jpeg", "ppl-26.jpeg"]
    @random_no = rand(25)
    @random_image = @images[@random_no]
  end

  def new
    @listing = Listing.new
    @user = User.find(session[:user_id])
    flash[:error] = nil
    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg", "32.jpeg"]
    @random_no = rand(29)
    @random_image = @images[@random_no]
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
    params.require(:listing).permit(:user_id, :location, :img_url)
  end

end
