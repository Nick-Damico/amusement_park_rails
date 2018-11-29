class UsersController < ApplicationController
  before_action :get_user, only: [:show, :edit]
  before_action :logged_in, only: [:show]

  def new
    @user = User.new
  end

  def show
    respond_to do |format|
      if @user
        format.html { render :show, status: :ok }
      else
        format.html {
          flash[:error] =  "User '#{params[:id]}' Not Found"
          redirect_to root_url
        }
      end
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html {
          flash[:success] = 'Successfully Signed Up'
          redirect_to @user
        }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit( :name, :height, :happiness, :tickets,
                                  :nausea, :admin, :password )
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end
end
