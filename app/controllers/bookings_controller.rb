class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
    @user = User.find(session[:user_id])
    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg"]
    @random_no = rand(29)
    @random_image = @images[@random_no]
  end

  def new
   @booking = Booking.new
   flash[:notice] = nil
   if Date.parse(params[:start_date]) < Date.today
     flash[:notice] = "Earliest booking date is #{Date.today}"
     @booking.start_date = Date.today
   else
     @booking.start_date = params[:start_date]
   end
   @listing = Listing.find(params[:id])
   @user = User.find(session[:user_id])
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to new_booking_path unless @booking.valid?
    session[:booking_id] = @booking.id
    redirect_to booking_path(@booking)
  end

  def edit
    flash[:error] = nil
  end

  def update
    @booking.update(booking_params)
    if @booking.valid?
      redirect_to booking_path(@booking)
    else
      flash[:error] = @booking.errors.full_messages
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(@booking.user)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:listing_id, :user_id, :start_date, :end_date)
  end

end
