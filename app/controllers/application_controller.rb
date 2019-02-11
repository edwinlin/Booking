class ApplicationController < ActionController::Base

	def welcome
		# @user = User.find(session[:user_id])
		render :welcome
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
		redirect_to "/sessions/new" unless logged_in?
	end

end
