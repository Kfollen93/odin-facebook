class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:welcome]
  # Most methods are covered by the Devise Gem.

  def welcome
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation_password)
  end

end
