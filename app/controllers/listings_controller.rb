class ListingsController < ApplicationController

	def index
		@listings = Listing.all
	end

	def new
		flash[:error] = nil
		@listing = Listing.new
	end

	def create
		@listing = Listing.create(listing_params)
		if @listing.valid?
			redirect_to listing_path(@listing)
		else
			render :new
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		@listing.update(listing_params)
		if @listing.valid?
			@listing.save
			redirect_to listing_path(@listing)
		else
			flash[:error] = @booking.errors.full_message
			render :edit
		end
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy
		redirect_to listings_path
	end

	private

	def listing_params
		params.require(:listing).permit(:name, :lister_id)
	end

end