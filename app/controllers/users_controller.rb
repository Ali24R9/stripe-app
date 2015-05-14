# for later use

class UsersController < ApplicationController
  before_action :authenticate_user!

  def new 
    @user = User.new
  end 

  def show
    # if current_user.id == params[:id]
      @user = User.find(params[:id])
      # redirect_to user_path
    # else
    #   flash[:notice] = "You cannot view that page"
    #   redirect_to root_path
    # end
  end

end