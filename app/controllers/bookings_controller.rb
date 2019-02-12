class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
    @user = User.find(session[:user_id])
  end

  def new
    flash[:error] = []
    @booking = Booking.new
    @booking.start_date = params[:start_date]
    @listing = Listing.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.valid?
      session[:booking_id] = @booking.id
      redirect_to booking_path(@booking)
    else
      flash[:error] = @booking.errors.full_messages
      redirect_to create_booking_path
    end
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
    redirect_to welcome_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:listing_id, :user_id, :start_date, :end_date)
  end

end
