class BookingsController < ApplicationController

	def index
		@bookings = Booking.all
	end

	def new
		flash[:error] = nil
		@booking = Booking.new
	end

	def create
		@booking = Booking.create(booking_params)
		if @booking.valid?
			redirect_to booking_path(@booking)
		else
			flash[:error] = @booking.errors.full_message
			render :new
		end
	end

	def show
		@booking = Booking.find(params[:id])
	end

	def edit
		@booking = Booking.find(params[:id])
	end

	def update
		@booking = Booking.find(params[:id])
		@booking.update(booking_params)
		if @booking.valid?
			@booking.save
			redirect_to booking_path(@booking)
		else
			flash[:error] = @booking.errors.full_message
			render :edit
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to bookings_path
	end

	private

	def booking_params
		params.require(:booking).permit(:name, :booker_id, :listing_id)
	end

end