class Door2DoorLocation
  def self.berlim_site
    { lat: 52.53, lng: 13.403 }
  end

  # According to https://www.movable-type.co.uk/scripts/latlong.html
  # This amounts to roughly 3.5km radius around the berlim site area
  def self.berlim_site_boundaries
    { max_lat: 52.5350, max_lng: 13.453 }
  end
end
