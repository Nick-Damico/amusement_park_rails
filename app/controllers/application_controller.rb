class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in
      unless session[:user_id]
        flash.now[:alert] = "Access Denied. Must login to View User profiles"
        redirect_to root_url
      end
  end

end
