class UsersController < ApplicationController

  before_filter :authenticate_admin!, only: [:index, :show, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to get_users_path
  end
end
