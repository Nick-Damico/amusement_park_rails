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

  end
end
