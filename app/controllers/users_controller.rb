class UsersController < ApplicationController

  def show
    @user = current_user
    @users = User.where.not(id: current_user)
  end

end
