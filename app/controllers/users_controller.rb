class UsersController < ApplicationController
before_action :authorize, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_opinions = @user.opinions.order(upvotes: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
  end

end
