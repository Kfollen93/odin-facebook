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

  def create
    @user = User.new(user_params)
    if @user.save
     flash[:notice] = "User about section was successfully created"
     redirect_to user_path(@user)
    else
     render 'new'
    end
  end  

  def edit
    @user = current_user
  end
  
  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
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
    params.require(:user).permit(:name, :about, :email, :password, :confirmation_password, :profile_picture)
  end

end