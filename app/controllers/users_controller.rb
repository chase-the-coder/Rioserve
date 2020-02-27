class UsersController < ApplicationController
  before_action :set_user, except: :update

  def show
  end

  def edit
  end

  def update
    if @user.update(restaurant_params)
      redirect_to user_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def restaurant_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
