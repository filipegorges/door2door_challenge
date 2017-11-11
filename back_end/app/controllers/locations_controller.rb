class LocationsController < ApplicationController
  before_action :set_vehicle, only: [:create]

  def create
    @vehicle.location = Location.new(location_params)
    if @vehicle.save
      head :no_content
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:vehicle_id])
    end

    def location_params
      params.require(:location).permit(:lat, :lng, :at, :vehicle_id)
    end
end
