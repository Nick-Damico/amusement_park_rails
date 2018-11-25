class UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:alert] = "Successfully Sign Up"
      redirect_to user_url(@user)
    else
      render :new, status: :bad_request
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :tickets,
      :nausea,
      :admin,
      :password
    )
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end
end
