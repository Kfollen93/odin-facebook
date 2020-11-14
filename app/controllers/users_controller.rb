class UsersController < ApplicationController
  before_action :authenticate_user!, :except => [:welcome]
  # Most methods are covered by the Devise Gem.

  def welcome
  end
  
  def index
    @users = User.all
  end
end
