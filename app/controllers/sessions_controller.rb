class SessionsController < ApplicationController

  def new
  end

  def create
    flash[:error] = nil
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Could Not Find You. Please try again."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to welcome_1_path
  end

end
