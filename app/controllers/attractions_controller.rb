class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    respond_to do |format|
      if @attraction
        format.html {
          render :show
        }
        format.json {}
      else
        format.html {
          flash[:error] = "Ride #{params[:id]} doesn't exist"
          redirect_to attractions_url
        }
        format.json {}
      end
    end
  end

  def ride
    attraction = Attraction.find_by(id: params[:id])
    attraction.take_ride(current_user)
    respond_to do |format|
      format.html {
        flash[:success] = "Thanks for riding the #{attraction.name}!"
        redirect_to current_user
      }
    end
  end
end
