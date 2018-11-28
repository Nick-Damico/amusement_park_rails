class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
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

  def create
    @attraction = Attraction.new(attraction_params)
    respond_to do |format|
      if @attraction.save
        format.html {
          flash[:success] = "Attraction #{@attraction.name} created."
          redirect_to @attraction
        }
      else
        format.html {
          render :new
        }
      end
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    respond_to do |format|
      if @attraction
        format.html {
          render :edit
        }
      else
        format.html {
          flash[:error] = "Attraction #{params[:id]} doesn't exist"
          redirect_to attractions_url
        }
      end
    end
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    respond_to do |format|
      if @attraction.update_attributes(attraction_params)
        format.html {
          flash[:success] = "Attraction #{@attraction.name} updated Successfully"
          redirect_to @attraction
        }
      else
        format.html {
          render :edit
        }
      end
    end
  end

  def ride
    attraction = Attraction.find_by(id: params[:id])
    msg = attraction.can_user_ride(current_user)
    respond_to do |format|
      if msg.any?
        format.html {
          flash[:error] = msg.join(' ')
          redirect_to current_user
        }
      else
        attraction.take_ride(current_user)
        format.html {
          flash[:success] = "Thanks for riding the #{attraction.name}!"
          redirect_to current_user
        }
      end
    end
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :happiness_rating, :min_height,
                                         :nausea_rating, :tickets)
    end

end
