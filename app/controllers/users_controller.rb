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

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == image.record
      image.purge
      redirect_back(fallback_location: request.referer)
    else
      redirect_to root_url, notice: "You can't do that!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmation_password, :profile_picture)
  end

end
