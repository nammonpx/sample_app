class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t(".success")
      redirect_to @user
    else
      flash.now[:danger] = t(".error")
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".error"
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
