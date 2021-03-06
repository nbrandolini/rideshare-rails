class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
  end

  def new
    @trip = Trip.new
    @trip.passenger = Passenger.find(params[:passenger_id])
    @action = passenger_trips_path(params[:passenger_id])
  end

  def create
    @trip = Trip.new
    @trip.passenger = Passenger.find(params[:passenger_id])
    @trip.driver = select_driver

    @trip.date = Date.today.to_s
    @trip.cost = 1000
    if @trip.save
      @trip.driver.update(available: false)

      redirect_to trip_path(@trip.id)
    else
      render :show
    end
  end


  def edit
    @trip = Trip.find_by(id: params[:id])
  end

  def update
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        redirect_to trip_path(@trip.id)
      else
        render :edit
      end
    else
      redirect_to trips_path
    end
  end

  def update_rating
    @trip = Trip.find_by(id: params[:id])
    if !@trip.nil?
      if @trip.update(trip_params)
        @trip.driver.update(available: true)
        redirect_to trip_path(@trip.id)
      else
        render :show
      end
    else
      redirect_to trips_path
    end
  end

  def destroy
    id = params[:id]
    @trip = Trip.find(id)
    @trip.destroy
  end

  private

  def trip_params
    return params.require(:trip).permit(:passenger_id, :driver_id, :rating, :available)
  end

  def select_driver
    drivers = Driver.all
    drivers_available = drivers.select { |driver| driver.available == true }

    return drivers_available.sample
  end

end
