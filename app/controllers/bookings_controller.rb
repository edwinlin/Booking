class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authorized, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def show
    flash[:error] = nil
    flash[:notice] = nil
    @user = User.find(session[:user_id])
    @images  = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "8.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "25.jpeg", "26.jpeg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg"]
    @random_no = rand(29)
    @random_image = @images[@random_no]
  end

  def new
   @booking = Booking.new
   if Date.parse(params[:start_date]) < Date.today
     flash[:notice] = "Earliest booking date is #{Date.today.strftime("%b %-d")}"
     @booking.start_date = Date.today
   else
     @booking.start_date = params[:start_date]
   end
   @listing = Listing.find(params[:id])
   @user = User.find(session[:user_id])
  end

  def create
   @booking = Booking.new(booking_params)
   if @booking.valid?
     books = @booking.listing.bookings.map{|k,v|{k.id=>k.start_date..k.end_date}}
     not_rejected = books.reject{|h|h[@booking.id]}
     ranged = not_rejected.map{|h|h.values}.flatten

     temp_updated_dates = @booking.start_date..@booking.end_date
     temp_updated_dates.each do |d|
       ranged.each do |r|
         if r.cover?d
           flash[:notice] = "Listing already booked for those days"
           return redirect_to create_booking_path(@booking.start_date, @booking.listing.id)
         end
       end
     end
     @booking.save
     session[:booking_id] = @booking.id
     redirect_to booking_path(@booking)
   else
     redirect_to new_booking_path
   end
  end

  def edit
    flash[:notice] = nil
    flash[:error] = nil
  end

  def update
    @booking.update(booking_params)
    @booking.start_date = @booking.temp_start
    @booking.end_date = @booking.temp_end
    if @booking.valid?
     books = @booking.listing.bookings.map{|k,v|{k.id=>k.start_date..k.end_date}}
     not_rejected = books.reject{|h|h[@booking.id]}
     ranged = not_rejected.map{|h|h.values}.flatten

     temp_updated_dates = @booking.start_date..@booking.end_date
     temp_updated_dates.each do |d|
       ranged.each do |r|
         if r.cover?d
           flash[:notice] = "Listing already booked for those days"
           return render :edit
         end
       end
     end
     @booking.save
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
    params.require(:booking).permit(:listing_id, :user_id, :start_date, :end_date, :temp_start, :temp_end)
  end

end
