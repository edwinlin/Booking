class BookersController < ApplicationController

	def index
		@bookers = Booker.all
	end

	def new
		flash[:error] = nil
		@booker = Booker.new
	end

	def create
		@booker = Booker.create(booker_params)
		if @booker.valid?
			redirect_to booker_path(@booker)
		else
			flash[:error] = @booking.errors.full_message
			render :new
		end
	end

	def show
		@booker = Booker.find(params[:id])
	end

	def edit
		@booker = Booker.find(params[:id])
	end

	def update
		@booker = Booker.find(params[:id])
		@booker.update(booker_params)
		if @booker.valid?
			@booker.save
			redirect_to booker_path(@booker)
		else
			flash[:error] = @booking.errors.full_message
			render :edit
		end
	end

	def destroy
		@booker = Booker.find(params[:id])
		@booker.destroy
		redirect_to bookers_path
	end

	def new_booker_listing
		@booker = Booker.find(params[:id])
		@listing = Listing.new
		@booking = Booking.new
		@booking.booker_id = @booker.id
		render :new_booker_listing
	end

	private

	def booker_params
		params.require(:booker).permit(:name)
	end

end