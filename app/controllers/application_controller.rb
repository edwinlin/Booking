class ApplicationController < ActionController::Base

	def welcome_1
	end

	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end

	def logged_in?
		!!current_user
	end

	def authorized
		redirect_to welcome_1_path unless logged_in?
	end

end
