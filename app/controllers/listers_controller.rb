class ListersController < ApplicationController

	def index
		@listers = Lister.all
	end

	def new
		flash[:error] = nil
		@lister = Lister.new
	end

	def create
		@lister = Lister.create(lister_params)
		if @lister.valid?
			redirect_to lister_path(@lister)
		else
			flash[:error] = @booking.errors.full_message
			render :new
		end
	end

	def show
		@lister = Lister.find(params[:id])
	end

	def edit
		@lister = Lister.find(params[:id])
	end

	def update
		@lister = Lister.find(params[:id])
		@lister.update(lister_params)
		if @lister.valid?
			@lister.save
			redirect_to lister_path(@lister)
		else
			flash[:error] = @booking.errors.full_message
			render :edit
		end
	end

	def destroy
		@lister = Lister.find(params[:id])
		@lister.destroy
		redirect_to listers_path
	end

	def create_new_listing
		@lister_id = Lister.find[params:id]
		
	end

	private

	def lister_params
		params.require(:lister).permit(:name)
	end

end