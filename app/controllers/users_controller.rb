class UsersController < ApplicationController
  before_action :authenticate_user!
  # Most methods are covered by the Devise Gem.

  def index
    @users = User.all
  end
end
