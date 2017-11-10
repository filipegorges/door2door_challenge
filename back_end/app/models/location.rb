class Location
  include Mongoid::Document
  field :lat, type: BigDecimal
  field :lng, type: BigDecimal
  field :at, type: DateTime
  belongs_to :vehicle
  validate :within_city_boundary

  private
    def within_city_boundary
      !(lat > Door2DoorLocation.berlim_site_boundaries[:max_lat] ||
        lng > Door2DoorLocation.berlim_site_boundaries[:max_lng])
    end
end
