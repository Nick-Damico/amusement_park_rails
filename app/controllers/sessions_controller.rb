class SessionsController < ApplicationController
  # before_action :get_user, only: [:create]
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    respond_to do |format|
      if user && user.authenticate(params[:user][:password])
        # login
        log_in(user)
        format.html {
          flash[:success] = 'Successfully logged in'
          redirect_to user
        }
        format.json {}
      else
        # error code
        format.html {
          flash.now[:danger] = "Invalid Name/Password match"
          render :new
        }
        format.json {}
      end
    end
  end

  def destroy
  end

  private

end
