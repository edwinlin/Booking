class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @images  = ["ppl-1.jpeg", "ppl-2.jpeg", "ppl-3.jpeg", "ppl-4.jpeg", "ppl-5.jpeg", "ppl-6.jpeg", "ppl-7.jpeg", "ppl-8.jpeg", "ppl-9.jpeg", "ppl-10.jpeg", "ppl-11.jpeg", "ppl-13.jpeg", "ppl-14.jpeg", "ppl-15.jpeg", "ppl-16.jpeg", "ppl-17.jpeg", "ppl-18.jpeg", "ppl-19.jpeg", "ppl-20.jpeg", "ppl-21.jpeg", "ppl-22.jpeg", "ppl-23.jpeg", "ppl-24.jpeg", "ppl-25.jpeg", "ppl-26.jpeg"]
    @random_no = rand(25)
    @random_image = @images[@random_no]
  end

  def new
    @user = User.new
    flash[:error] = nil
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    flash[:error] = nil
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to welcome_1_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :img_url)
  end
end
