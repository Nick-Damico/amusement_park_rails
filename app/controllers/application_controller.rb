class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in
      unless session[:user_id]
        flash[:error] = "Access Denied. Must login to View User profiles"
        redirect_to root_url
      end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def is_current_user_authorized
    if current_user != @user
      flash[:error] = "Access Denied. You are not authorized"
      redirect_to current_user
    end
  end

end
