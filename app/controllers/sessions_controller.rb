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
          flash.now[:error] = "Invalid Name/Password match"
          render :new
        }
        format.json {}
      end
    end
  end

  def destroy
    respond_to do |format|
      if logged_in?
        format.html {
          log_out()
          flash.now[:success] = "Successfully Logged Out"
          redirect_to root_url
          }
        format.json {}
      else
        format.html {}
        format.json {}
      end
    end
  end
end
