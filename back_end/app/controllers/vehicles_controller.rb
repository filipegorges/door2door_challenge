class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:destroy]

  def index
    @vehicles = Vehicle.with_location
    render json: @vehicles.as_json(include: :location, root: true)
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      head :no_content
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.archive
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def vehicle_params
      params.permit(:id)
    end

end

